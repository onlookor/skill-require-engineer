---
stage: s2
title: Requirements Elicitation
pact_rule: "business_goal → raw_requirement"
pact_participant: business_analyst
methods_required: [brown-cow, implementation-neutrality, opportunity-assessment]
validators_required: [implementation_leak_terms, schemas/raw_requirement_artifact.json]
input_artifact: schemas/business_goal_artifact.json
output_artifact: schemas/raw_requirement_artifact.json
human_checkpoint: "Conflict adjudication"
gate: gate-2
elicitation_grounding: >
  Technique inventory and completion criteria from Wiegers & Beatty (2013), Software Requirements
  3rd Ed., Chapter 7 "Requirements elicitation" (pp.119-142): Interviews (p.121), Workshops (p.122),
  Focus groups (p.124), Observations (p.125), Questionnaires (p.127), System interface analysis
  (p.127), User interface analysis (p.128), Document analysis (p.128), Planning elicitation (p.129),
  Classifying customer input (p.135), "How do you know when you're done?" (p.138),
  Assumed and implied requirements (p.140), Finding missing requirements (p.141).
  Conflict handling: Wiegers Ch.6 "Resolving conflicting requirements" (p.116) -> methods/conflict-resolution.md
---

# S2: Requirements Elicitation

## 1. Identity

S2 mines **raw requirement material** from stakeholders against the seeded business goals. It is NOT structuring into EARS syntax (that is S3) and NOT judging quality (that is S5). S2 output is a traceable, source-attributed material pack: every item knows who said it, when, and how it was obtained.

**Precondition:** `business_goal ∈ Counter` (Gate-1 passed). Without it, S2 must not start — elicitation without an anchoring goal degenerates into a wish-collection session.

## 2. PACT Operation

```
Rule-P: business_goal → raw_requirement
Participant: business_analyst
Gate: consumes business_goal, produces raw_requirement
Precond: business_goal ∈ Counter
```

`business_goal` is a **source type** (`Precond = ∅`), seeded by `product_owner` under Rule-S; no participant may hold `produces business_goal` (§3.1 constraint 6). S2's operation on it is therefore Rule-E (consume) + Rule-P (produce), not a transformation of an internally produced Token.

- The `business_analyst` consumes the `business_goal` Token and produces `raw_requirement` Tokens. Consumption is explicit (Rule-E); no automatic downstream cascade follows (Zero Implicit Actions) — S3 starts only when `requirements_engineer` explicitly begins.
- **Standalone mode:** same sequence, linear; the consume step degrades to "mark S1 output as used".

## 3. Input Contract

From `business_goal_artifact.json`:

| Field | Use in S2 |
|:---|:---|
| business_goals[] | Anchor and filter: every elicited item must answer "which goal does this serve?" |
| stakeholder_map[] | Coverage checklist: each role must be reached by ≥1 technique |
| scope_boundary | Frame control: items outside in_scope are recorded as out-of-scope candidates, not requirements |
| problem_frame_analysis | Guides which problem-world phenomena (b) to observe |
| open_questions[] | S2 must attempt to answer these first |

Missing input contract fields → STOP and return to S1. Do not guess.

## 4. Step List

### Step 1: Elicitation Planning (technique selection)

- **Operation:** For each stakeholder role in the map, select at least one technique from the grounded inventory (frontmatter). Use the selection matrix:

| Stakeholder type | Primary techniques | Reason |
|:---|:---|:---|
| End users | Observations + situational interviews | Users often cannot articulate tacit workflow knowledge |
| Business experts / domain owners | Workshops + scenario walkthroughs | Need collision and consensus-building |
| Management / sponsors | Structured interview + business case review | Focused on ROI and strategic alignment |
| Operations / support | Log/incident analysis + exception-case collection | Focused on boundaries and failures |
| External systems / partners | Interface document analysis + contract review | Focused on constraints and compatibility |

- **Output:** elicitation plan {role → technique(s) → target open_questions}.
- **Completion criterion:** every role has ≥1 technique; at least one non-verbal technique (observation / document analysis / modeling) is in the plan, because much knowledge is tacit and cannot be spoken.
- **Failure handling:** technique infeasible (no access) → record gap in coverage_report as `missing`; do not silently drop the role.

### Step 2: Conduct Elicitation (JTBD questioning)

- **Operation:** In every session, decompose stated needs with the job structure: situation → task → expected outcome ("When I am in <situation>, I want to <task>, so that <outcome>"). Follow each answer with the repeated-Why probe until a business goal link or a dead end is reached. Record verbatim statements plus context.
- **Output:** session notes with verbatim quotes.
- **Completion criterion:** every recorded item has situation/task/outcome or an explicit "could not decompose" flag.
- **Failure handling:** stakeholder states only a solution → apply presumed-solution reverse engineering (`./methods/implementation-neutrality.md` §4) inside the session; record both the original statement and the derived essence.

### Step 3: Negative and Exception Elicitation

- **Operation:** For every normal-path item ask: "What can go wrong here? What must NOT happen? What if the counterparty fails/cheats/delays?" Record unwanted-behaviour material. Unwanted behaviour is a major source of omissions (EARS paper §2, Problem 4: Omission — see `../methods/ears-syntax.md` §2).
- **Output:** unwanted-behaviour material items, tagged `negative`.
- **Completion criterion:** every core business flow has at least one associated negative item or an explicit "no known unwanted behaviour" note.
- **Failure handling:** none found after probing → record the probe itself as evidence, not silence.

### Step 4: Brown Cow Classification of Each Item

- **Operation:** Classify every collected statement using `../kb/brown-cow-patterns.yaml` classification rules:
  - description of current way of working → **How-Now** (keep minimal; abstract upward)
  - current business rule/policy → **What-Now** (essence carry-over candidate)
  - desired change / new capability → **Future-What** (requirement material ⭐)
  - demanded technology/UI/component → **Future-How** (presumed solution; reverse-engineer before use)
- **Output:** each item tagged with its quadrant + action taken.
- **Completion criterion:** no item left unclassified.
- **Failure handling:** Future-How item that resists reverse engineering → escalate at human checkpoint, do not discard silently.

### Step 5: Classify Customer Input

- **Operation:** Separate true requirement material from other input types (per Wiegers Ch.7 "Classifying customer input", p.135): requirement material / idea or enhancement suggestion / constraint / business rule / out-of-scope note. Only requirement material becomes `raw_requirements[]`; the rest go to open_questions or constraint notes.
- **Output:** classified items.
- **Completion criterion:** every item has exactly one class.
- **Failure handling:** ambiguous class → mark `open_questions` entry "classification undecided".

### Step 6: Source Attribution and Traceability

- **Operation:** For every raw requirement record: id, source (who / where observed), date, technique, context, statement (business language), traces_to_goal (business_goal id from S1). An item that cannot be traced to any goal is flagged, not silently kept.
- **Output:** `raw_requirements[]` complete.
- **Completion criterion:** 100% of items have non-empty source and traces_to_goal (or explicit orphan flag).
- **Failure handling:** orphan items → present at human checkpoint with recommendation (link to a goal or reject).

### Step 7: Coverage Report

- **Operation:** Compare techniques actually executed against the plan per stakeholder role; compute coverage_status per role: complete / partial / missing.
- **Output:** `coverage_report[]`.
- **Completion criterion:** report covers every role in stakeholder_map.
- **Failure handling:** role coverage `missing` → Gate-2 blocks unless the human checkpoint explicitly accepts the gap with rationale.

### Step 8: Conflict Flagging

- **Operation:** Scan pairs of items for contradictions (same event described differently; incompatible metrics; mutually exclusive rules). For each conflict record both item ids, nature, and resolution_status. Resolution method per `../methods/conflict-resolution.md` (negotiation / decision-authority escalation). The agent flags and structures; the human adjudicates.
- **Output:** `conflict_flags[]`.
- **Completion criterion:** every detected conflict is either `resolved` (with recorded rationale) or `escalated`.
- **Failure handling:** agent must never pick a winner silently; unresolved conflicts stay `escalated`.

### Step 9: Implementation Leak Filtering

- **Operation:** Scan all statements against `../validators/implementation_leak_terms.yaml`. Hits → record in `implementation_leak_flags[]` with leaked_term and suggested_abstraction (rewrite table in `../methods/implementation-neutrality.md` §6.2). Replace statement with the abstraction; keep original in context notes.
- **Output:** `implementation_leak_flags[]` + cleaned statements.
- **Completion criterion:** every flag has a suggested_abstraction or an authority-mandated constraint justification.
- **Failure handling:** unresolvable leak → human checkpoint.

## 5. Output Contract

`RawRequirementArtifact` = ThingRef of the produced `raw_requirement` Token. Schema: `../validators/schemas/raw_requirement_artifact.json`.

| Field | Content |
|:---|:---|
| raw_requirements[] | {id, source, date, technique, context, statement, traces_to_goal, open_questions, brown_cow_quadrant, input_class, negative: bool} |
| coverage_report[] | {stakeholder, techniques_used, coverage_status} |
| conflict_flags[] | {requirement_a, requirement_b, nature, resolution_status} |
| implementation_leak_flags[] | {requirement_id, leaked_term, suggested_abstraction} |

## 6. Gate Checklist (gate-2)

- [ ] G2.1 Coverage ≥ 80% of stakeholder roles at `complete` or `partial`; no `missing` without accepted rationale
- [ ] G2.2 Every conflict_flag is `resolved` (rationale recorded) or `escalated`
- [ ] G2.3 Every implementation_leak_flag processed (abstracted or justified as constraint)
- [ ] G2.4 Every raw_requirement has non-empty `source` and `traces_to_goal`
- [ ] G2.5 Every item Brown-Cow-classified; no Future-How item passed through un-reverse-engineered
- [ ] G2.6 At least one non-verbal technique was actually executed
- [ ] G2.7 Negative/exception material collected for every core flow (or explicit probe evidence)
- [ ] G2.8 **Human checkpoint: conflicting requirements adjudicated by humans**

## 7. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| Confirmation-style elicitation | Asking "do you like this button design?" | Presumed-solution question; ask about the job, not the artifact |
| Solution recorded as requirement | "Stakeholder wants a mobile app" logged as requirement | Classify Future-How; reverse-engineer to essence first |
| Missing source | Item logged without who/where | Unattributable items cannot be validated later; re-elicit or drop |
| Normal-path-only elicitation | Only happy flows recorded | Step 3 negative elicitation is mandatory per EARS omission finding |
| Agent resolves conflicts silently | Picking the manager's version over the user's | Conflicts go to human checkpoint; agent structures, human decides |

## 8. Human Checkpoint & Co-Creation Loop

```
Agent Draft (material pack + classification + conflict list)
   → Human Review (stakeholders adjudicate conflicts; confirm coverage gaps)
   → Agent Refine (apply adjudications, re-run leak scan)
   → Quality Gate (gate-2)
   → PASS: raw_requirement Token produced / FAIL: loop back (max 3 rounds)
```

After 3 failed rounds: escalate with full context; typically the cause is unreachable stakeholders or an unstable S1 goal — recommend returning to S1 if goals keep shifting.

**After Gate-2:** `raw_requirement ∈ Counter`; the consumed `business_goal` Token is in Archive (auditable). S3 may begin when `requirements_engineer` explicitly starts (Zero Implicit Actions).
