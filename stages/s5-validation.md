---
stage: s5
title: Requirements Validation
pact_rule: "specification → validation_report; validation_report → re_baseline (baselining, §8)"
pact_participant: validator + release_manager (baselining)
methods_required: [specification-quality, ears-syntax, acceptance-specs, traceability]
validators_required: [ears_regex, ambiguous_words, implementation_leak_terms, schemas/validation_report_artifact.json, schemas/review_report.json]
input_artifact: "SpecificationArtifact (schemas/specification_artifact.json)"
output_artifact: "ValidationReportArtifact (schemas/validation_report_artifact.json); review_report.json in Review Mode"
human_checkpoint: "Validation confirmation and sign-off"
gate: gate-5
---

# S5: Requirements Validation

## 1. Identity

S5 confirms that the baseline specification **correctly reflects stakeholder intent** and **can be verified**. It operates in two modes:

- **Production mode:** the final stage before baselining (validation_report production).
- **Review Mode:** structured audit of an existing requirement set, triggered by "review" / "audit" / "check" signals per SKILL.md §4.5. Review Mode never free-texts ("looks good"); findings are structured, Blocking/Non-Blocking, and written to `review_report.json`.

S5 is NOT specification writing (S4) and NOT change management (S6).

## 2. PACT Operation

```
Rule-P: specification -> validation_report
Participant: validator
Gate: reads specification via raw_requirement,
      consumes specification, produces validation_report
Precond: specification ∈ Counter (gate-4 passed)
```

- **`via raw_requirement` (provenance sensitivity):** the validator reads only specifications produced from a specific `raw_requirement` instance. If the upstream raw_requirement was consumed and archived (stranding risk), the validator is blocked — report, do not reconstruct.
- **Read is non-destructive:** multiple reviewers can read the same specification Token; the Counter does not change until the validator's explicit consume.
- **Standalone mode:** linear hand-off from the S4 baseline; identical content steps.

## 3. Input Contract

From `specification_artifact.json`:

| Input | Required for |
|:---|:---|
| analysis_model.ears_requirements[] | syntax audit + quality assessment |
| traceability_matrix | traceability audit |
| srs_document.sections | structural completeness re-check |
| business_goal_artifact (S1) | necessity checks |

**Blocking conditions:** gate-4 not passed → STOP. specification Token absent in Counter (PACT) → STOP with stranding report.

## 4. Step List (Production Mode)

### Step 1: EARS Syntax Audit

- **Operation:** Run every EARS entry through `../validators/ears_regex.yaml` (strict + flexible patterns, complex combinations). Each entry must match exactly one pattern.
- **Output:** syntax audit results appended to quality_report.
- **Completion criterion:** 100% entries matched exactly one pattern.
- **Failure handling:** no_match → defect {category: ambiguous/incomplete, severity per §10.3}; return entry to S3 author.

### Step 2: Specification-Quality Assessment (per statement)

- **Operation:** Apply the nine-point checklist from `../methods/specification-quality.md` §10.1 to each requirement, in order, recording pass/fail per attribute:
  1. Complete — no unflagged gaps; TBDs flagged
  2. Correct — matches an authoritative source
  3. Feasible — within known technical/time/budget constraints
  4. Necessary — traces to a business objective; "why included?" answerable
  5. Prioritized — implementation priority assigned
  6. Unambiguous — single interpretation; zero hits on `../validators/ambiguous_words.yaml`
  7. Verifiable — a tester can derive a test or verification approach
  8. Implementation-neutral — observable-behavior test passes; zero hits on `../validators/implementation_leak_terms.yaml` outside Mandated Constraints
  9. Atomic — one rule per statement (no hidden "and"/"or" conjunctions, specification-quality §8)
- **Output:** per-requirement attribute results feeding quality_report.defects[].
- **Completion criterion:** every requirement assessed on all nine attributes; no attribute skipped.
- **Failure handling:** unverifiable/infeasible findings are Blocking per §10.3; do not downgrade severity to pass the gate.

### Step 3: Acceptance Criteria Generation (Given-When-Then)

- **Operation:** For every EARS entry generate ≥1 executable acceptance spec per `../methods/acceptance-specs.md`:
  - Format: Given (precondition) / When (single action or trigger) / Then (observable post-condition). Adzic rule: the When clause contains a single action.
  - Event-driven EARS → When = trigger; State-driven → Given = state; Unwanted behaviour → Given/When = unwanted condition; Optional feature → Given = feature enabled.
  - Where Cockburn use-case flows exist, derive Given-When-Then from main success scenario + extensions (acceptance-specs bridging table).
- **Output:** executable_specs[] {requirement_id, given, when, then, priority}.
- **Completion criterion:** every EARS entry has ≥1 acceptance spec; every spec is observable from outside (no implementation terms).
- **Failure handling:** entry that yields no derivable spec → Verifiable defect (Blocking); escalate to S3 author with the failed derivation attempt.

### Step 4: Traceability Audit

- **Operation:** Execute the five audit checks from `../methods/traceability.md` §7.2:
  1. Missing requirements (goal → user → system chain intact)
  2. Orphan check (every EARS entry traces upward)
  3. Unnecessary requirements (gold-plating candidates)
  4. Coverage (every entry with acceptance spec linked)
  5. Suspect-link protocol for anything changed since gate-4
- **Output:** traceability_audit {coverage, orphans[], broken_links[]}.
- **Completion criterion:** coverage = 1.0; orphans empty; broken_links empty.
- **Failure handling:** orphans → Blocking; gold-plating candidates → Non-Blocking recommendation for removal (human decides).

### Step 5: Review Checklist Generation

- **Operation:** Pre-generate the human review checklist: per-requirement nine-point results, defect list sorted by severity, traceability summary, open TBD inventory. This is the material for the human checkpoint — reviewers never start from a blank page.
- **Output:** review_checklist (string, structured).
- **Completion criterion:** checklist covers 100% of requirements.
- **Failure handling:** n/a (deterministic aggregation).

### Step 6: Sign-Off Recording

- **Operation:** Record sign_off_status from the human checkpoint: pending / approved / conditionally_approved (conditions enumerated) / rejected. Record sign_off_by and sign_off_date.
- **Output:** sign-off fields populated.
- **Completion criterion:** status is approved or conditionally_approved with explicit conditions; rejected → rework loop.
- **Failure handling:** pending after checkpoint deadline → escalate; never self-approve (the agent is not a signatory).

## 5. Step List (Review Mode)

Triggered by SKILL.md §4.5 signals on an existing requirement set (which may predate this pipeline):

1. **Scope declaration:** which artifact/set is reviewed; reviewer and date recorded.
2. **Structured audit only:** run Steps 1, 2, 4 above against the provided set; no rewriting of requirements.
3. **Findings classification:** every finding gets category, severity (Blocking / Non-Blocking per `../methods/specification-quality.md` §10.3), evidence, suggested_fix.
4. **Verdict:** pass / conditional_pass / fail, computed from blocking_count (0 → pass; >0 → fail; conditional_pass only when all Blocking items have approved waivers).
5. **Output:** `review_report.json` (schema: `../validators/schemas/review_report.json`). Free-text-only assessments are forbidden.

## 6. Output Contract

`ValidationReportArtifact` (schema: `../validators/schemas/validation_report_artifact.json`):

| Field | Content |
|:---|:---|
| quality_report | {total, pass_count, pass_rate, defects[]} |
| executable_specs | Given-When-Then per EARS entry |
| traceability_audit | {coverage, orphans, broken_links} |
| review_checklist | pre-generated human review material |
| sign_off_status / sign_off_by / sign_off_date | from Step 6 |

## 7. Gate Checklist (gate-5)

- [ ] G5.1 pass_rate ≥ 0.95
- [ ] G5.2 All critical-severity defects closed
- [ ] G5.3 traceability_audit.coverage = 1.0; no orphans or broken links
- [ ] G5.4 Every EARS entry has ≥1 acceptance spec
- [ ] G5.5 Zero implementation-leak terms outside Mandated Constraints
- [ ] G5.6 Zero ambiguous-word hits without approved waiver
- [ ] G5.7 sign_off_status = approved or conditionally_approved (conditions explicit)
- [ ] G5.8 **Human checkpoint: validation results confirmed by human**

## 8. After Gate-5: Baselining

```
Rule-P: validation_report → re_baseline
Participant: release_manager
Gate: reads validation_report, consumes validation_report, produces re_baseline
```

The release manager produces the `re_baseline` Token (schema: `re_baseline_artifact.json`) containing the frozen requirement_items with versions, statuses, acceptance criteria, and change histories. `re_baseline` becomes the precondition for downstream lifecycle phases (architecture, implementation, test) — outside this skill's scope. Any later change goes through S6.

**Composition interface (§1.8).** `re_baseline` is the shared type through which this fragment composes with the downstream software-engineering fragment. This fragment is the **sole declarer** of its Precondition rule (`validation_report → re_baseline`); the downstream fragment declares the type but must not re-declare the rule (C2 / D18 single-side declaration) and must not hold `produces re_baseline` (C4). Downstream seed-injection of `re_baseline` is legal only when the RE fragment is *not* deployed — see `docs/skill-adaptation.md` in the PACT repository for the combined-deployment consequence (advisory `SEED_PRODUCE_OVERLAP`).

## 9. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| Self-approval | Agent marks sign_off approved without human | sign_off is human-only; agent records, never decides |
| Severity downgrade | Blocking leak re-labelled minor to pass G5.1 | Severities follow §10.3 mechanically |
| Unobservable acceptance spec | "Then the JWT is returned" | Observable business outcome: "Then access is granted" (implementation-neutrality) |
| Free-text review verdict | "Requirements look mostly good" | Review Mode requires structured findings + verdict (SKILL §4.5) |
| Reviewing wrong provenance | Validating a spec whose raw_requirement was archived | `via` gate blocks; report stranding, do not reconstruct |

## 10. Human Checkpoint & Co-Creation Loop

```
Agent Draft (audit results + generated acceptance specs + checklist)
   → Human Review (stakeholders confirm intent; testers confirm testability)
   → Agent Refine (defect fixes routed to owning stages S3/S4)
   → Quality Gate (gate-5)
   → PASS: produce validation_report Token / FAIL: loop back (max 3 rounds)
```

After 3 failed rounds: escalate with the full defect list; persistent failures usually indicate upstream instability (return to S2/S3) rather than validation defects.
