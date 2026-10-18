---
stage: s6
title: Requirements Management (Cross-cutting)
pact_rule: "change_request → change_impact_report; change_impact_report → change_approval; change_controller: reads re_baseline, reads change_approval, consumes re_baseline, consumes change_approval, produces specification"
pact_participant: change_requester (seed authority) + change_analyst + ccb + change_controller
methods_required: [impact-analysis, conflict-resolution, traceability, specification-quality]
validators_required: [schemas/re_baseline_artifact.json, schemas/specification_artifact.json]
input_artifact: "change request + re_baseline (schemas/re_baseline_artifact.json)"
output_artifact: "new specification Token (PACT) / updated baseline (standalone)"
human_checkpoint: "CCB approval / rejection of every change"
gate: "applies gates 3-5 to the changed subset"
---

# S6: Requirements Management (Cross-cutting)

## 1. Identity

S6 is NOT a sequential stage. It is the **cross-cutting change protocol** that wraps all stages: change control, version management, traceability maintenance, and status tracking. In PACT terms, a change is never an in-place edit — it is **consume the superseded baseline Token + produce a new specification Token**, with the Archive preserving the audit trail.

## 2. PACT Operation

The change loop is a four-participant chain, not one participant. `pact/re_fragment.pact` is authoritative; the block below mirrors it verbatim.

```
Change loop (Rule-S + Rule-E + Rule-P):
  0. change_requester seeds change_request          (Rule-S; source type, no producer may exist)
  1. change_analyst    reads re_baseline,           (Rule-R, non-destructive — the current
                       reads change_request,         baseline is the impact-analysis start point)
                       consumes change_request,     (Rule-E -> Archive; the request is retired
                       produces change_impact_report  once analysed)
  2. ccb               reads change_impact_report,
                       consumes change_impact_report, (Rule-E -> Archive)
                       produces change_approval      (human-only; see Step 4)
  3. change_controller reads re_baseline,
                       reads change_approval,
                       consumes re_baseline,         (Rule-E -> Archive; the superseded
                       consumes change_approval,       baseline is retired here)
                       produces specification        (Rule-P; Precond = {raw_requirement})
```

**Why `specification` is not consumed here.** `Precond(specification) = {raw_requirement}`, so Rule-P requires `raw_requirement` to still be on the Counter. The *old* `specification` Token was already consumed by `validator` in S5 (`consumes specification`); by the time a change arrives the Counter holds `raw_requirement` and `re_baseline`, not the old specification. Consuming `re_baseline` is therefore the only correct "retire the superseded state" action, and `raw_requirement` must never be consumed — doing so would make the change loop unable to re-produce `specification` and would strand `validator`'s `via raw_requirement` witness (Appendix A.6).

**Why `change_approval` is a separate Token type.** Step 4's red line ("the agent NEVER approves on behalf of the CCB") is enforced *structurally*, not by prose: `change_approval` has exactly one producer gate (`ccb`), and `Precond(change_approval) = {change_impact_report}` means no approval can exist without an impact analysis. Reject and defer produce **no Token at all** (Zero Implicit Actions) — the chain simply does not advance.

**Two producers of `specification` are legal.** `requirements_engineer` (S3/S4 forward chain) and `change_controller` (this loop) both hold `produces specification`. RHS Uniqueness constrains the *Precondition Graph* (at most one rule per type), not the number of producer gates. This is what lets the change loop reuse the existing rule `raw_requirement → specification` instead of introducing a cycle in the Precondition Graph.

**Known expression limit.** The new `specification`'s `depends_on` records `{raw_requirement id, change_request id}`. It cannot record `change_approval`: `depends_on` entries are `via` witnesses keyed to Precondition types, and `change_approval` is not in `Precond(specification)`. The approval link is preserved instead by the Archive — `change_approval`'s `exhausted_at` / `exhausted_by` name `change_controller` and the moment of consumption. Audit reads the Archive, not `depends_on`.

**Key invariants:**
- **Change = consume + new production.** The superseded `re_baseline` and the spent `change_approval` enter the Archive immutable; the new Token carries `depends_on` recording the change source. (Zero Implicit Actions: consuming them does NOT cascade downstream automatically.)
- **Baselined content is law:** after gate-5, no modification outside this protocol.
- **Stranding guard:** before consuming a Token that downstream participants read `via`, verify no participant will be blocked; if one would be, warn and require explicit re-production plan (PACT appendix A.6 stranding risk).
- **Standalone mode:** same protocol with files: archive the old version (move to `_archive/` with timestamp), write the new version with incremented version number and change_history entry.

## 3. Input Contract

| Input | Required for |
|:---|:---|
| change_request {requester, description, urgency, origin} | step 1 registration |
| re_baseline_artifact (current baseline) | impact analysis starting point |
| traceability_matrix | ripple computation |

**Blocking conditions:** change request without requester or origin → reject as ungrounded (Wiegers Ch.28: every change originates from an authorized source). Baseline absent → STOP.

## 4. Step List

### Step 1: Change Request Registration

- **Operation:** Record the request with unique id, requester, date, origin (which business goal / stakeholder / regulation), urgency. "All changes must follow the process. If a change request is not submitted in accordance with this process, it will not be considered." (Wiegers Ch.28 policy 1, via `../methods/impact-analysis.md` §3).
- **PACT:** `change_request` is a **source type** (`Precond = ∅`). It enters only by Rule-S, seeded by `change_requester`. No participant holds — or may hold — `produces change_request`; §3.1 constraint 6 makes such a gate an ill-formed declaration. Registration *is* the seed act.
- **Output:** registered change_request.
- **Completion criterion:** all registration fields populated.
- **Failure handling:** incomplete request → return to requester; do not proceed. A request with no requester or no origin is rejected as ungrounded and is never seeded.

### Step 2: Impact Analysis

- **PACT:** `change_analyst` reads `re_baseline` (non-destructive — the baseline survives as the start point) and `change_request`, consumes `change_request`, produces `change_impact_report`.
- **Operation:** Execute the procedure from `../methods/impact-analysis.md` exactly, in order:
  1. Identify affected requirement entries (search traceability_matrix for entities mentioned by the change).
  2. Trace upward: affected business goals.
  3. Trace downward: affected downstream artifacts (design/code/test columns — query, never guess; if columns are empty, state "downstream impact not yet traceable").
  4. Lateral conflict detection: affected entries vs unaffected entries (state-machine contradictions, decision-table contradictions, NFR contradictions).
  5. Generate the impact report: direct requirements (list + count), affected goals, affected downstream (list + count), conflicts (list or "none"), recommended handling (revise / add / retire), effort estimate (low / medium / high).
- **Output:** impact report.
- **Completion criterion:** affected_requirements non-empty, or explicit "cannot locate impact scope" flag → escalate to human (never proceed on a guess).
- **Failure handling:** impact unlocatable → STOP, escalate with the search trail.

### Step 3: Conflict Resolution

- **Operation:** For every conflict found in Step 2.4, apply `../methods/conflict-resolution.md`: classify the conflict type, apply the dispute-resolution hierarchy, prepare the negotiation frame. Semantic conflicts between stakeholders are NOT decided by the agent.
- **Output:** resolution proposal or escalation record.
- **Completion criterion:** every conflict either has a resolution proposal with rationale or is escalated.
- **Failure handling:** unresolvable conflict → escalate to stakeholder meeting; mark change blocked.

### Step 4: Human Approval (CCB) — MANDATORY

- **PACT:** `ccb` reads `change_impact_report`, consumes it, produces `change_approval`. `ccb` is the **only** holder of `produces change_approval`.
- **Operation:** Present to the change control board: change request + impact report + conflict resolutions + recommendation. The CCB decides approve / reject / defer. "The project's change control board (CCB) will decide which changes to implement." (Wiegers Ch.28 policy 3).
- **Output:** approval decision with approvers and date.
- **Completion criterion:** explicit decision recorded; rejection records the reason.
- **Failure handling:** the agent NEVER approves, rejects, or defers on behalf of the CCB; pending decision = blocked change. No work on unapproved changes (Wiegers policy 2). Reject and defer produce **no Token** — `change_controller` then has no `change_approval` to consume and cannot advance (Zero Implicit Actions).

### Step 5: Execute Consume + New Production

- **Operation:** After approval:
  1. PACT: `change_controller` reads `re_baseline` and `change_approval`, consumes both (→ Archive), and produces the new `specification` Token with `depends_on = {raw_requirement id, change_request id}`. It does **not** consume any `specification` — see §2.
  2. Standalone: move old baseline file to `_archive/<timestamp>_<version>/`, write new baseline with version incremented per the scheme in `re_baseline_artifact.json` change_history.
  3. Apply the approved change content through the normal S3→S4→S5 steps on the changed subset only (gates 3-5 apply to the subset).
- **Output:** new specification Token / new baseline version.
- **Completion criterion:** new Token/version exists; old Token archived intact and immutable.
- **Failure handling:** stranding risk detected before consumption → halt consumption until re-production plan is confirmed.

### Step 6: Traceability Update (Suspect Links)

- **Operation:** Per `../methods/traceability.md` §5: mark all links touching the changed artifact as suspect; re-verify each; clear manually after consistency restored. Update the traceability_matrix with new/removed links. "This process helps ensure that you've accounted for the known ripple effects of a change."
- **Output:** updated traceability_matrix; suspect links cleared.
- **Completion criterion:** zero uncleared suspect links.
- **Failure handling:** suspect link that cannot be re-verified → open issue on the affected downstream artifact owner.

### Step 7: Version Tagging and Notification

- **Operation:** Assign the new baseline_version; append change_history entry {version, date, author, reason, approved_by}; notify all affected parties recorded in the impact report. "Approved changes are communicated to all affected participants." (Wiegers Ch.28 condition 4).
- **Output:** version manifest updated; notifications logged.
- **Completion criterion:** every affected party in the impact report has a notification record.
- **Failure handling:** unreachable party → escalation record; change remains visible in change log.

## 5. Requirement Status Model

Each requirement_item carries a status (schema: `re_baseline_artifact.json`):

```
Draft -> Proposed -> Approved -> Implemented -> Verified -> Released
            \-> Rejected
      Approved -> Deferred
      Implemented -> Failed_Verification -> Rework -> Approved
```

Transitions are triggered ONLY by gate results and explicit decisions — never automatically (Zero Implicit Actions).

## 6. Cross-cutting Responsibilities (per stage)

| Event | S6 action |
|:---|:---|
| Any stage produces an artifact | auto-register its items into the traceability_matrix |
| Gate-3/4/5 passes | update requirement_item.status; version tag |
| Gate fails | record failure in change/quality log; no status advance |
| Baseline produced (post gate-5) | freeze; all further edits via this protocol |
| Periodic (or on demand) | traceability health report (coverage, orphans, suspect links, stale items) |

## 7. Escalation Policy

| Situation | Escalation |
|:---|:---|
| Impact analysis cannot locate scope | Human expert, with full search trail |
| Conflict unresolvable by method | Stakeholder meeting |
| Same change request fails gates 3 times | Project lead; reconsider the originating business goal |
| Scope creep detected (change without request) | Warning + mandatory change process (SKILL.md §6.3) |
| Stranding risk before consumption | Halt; require re-production plan |
| Stakeholder unavailable for decision | Mark blocked; never guess the decision |

## 8. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| In-place edit of baseline | Directly modifying a baselined EARS entry | Consume + new production with depends_on |
| Work before approval | Implementing a change while CCB pending | Wiegers policy 2: no work on unapproved changes |
| Agent decides approval | Auto-approving low-risk changes | CCB decision is human-only, always |
| Guessing downstream impact | Filling code_element column from names | Query existing links; report "not yet traceable" if empty |
| Silent consumption | Consuming a Token downstream `via` readers depend on | Stranding check before every consumption |

## 9. Human Checkpoint & Co-Creation Loop

```
Agent Draft (impact report + conflict proposals + change plan)
   → Human Review (CCB deliberates; approves / rejects / defers)
   → Agent Execute (consume + new production; traceability update)
   → Quality Gate (gates 3-5 on the changed subset)
   → PASS: new baseline / FAIL: loop back (max 3 rounds per change)
```

After 3 failed rounds on one change request: escalate to project lead with full history; the usual root cause is an unstable originating goal, which may require returning to S1.
