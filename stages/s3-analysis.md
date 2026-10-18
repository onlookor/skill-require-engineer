---
stage: s3
title: Requirements Analysis
pact_rule: "raw_requirement → specification (analysis sub-step; S4 completes the same Rule)"
pact_participant: requirements_engineer
methods_required: [ears-syntax, implementation-neutrality, problem-statement, brown-cow]
validators_required: [ears_regex, implementation_leak_terms, schemas/specification_artifact.json]
input_artifact: schemas/raw_requirement_artifact.json
output_artifact: schemas/specification_artifact.json (analysis_model part)
human_checkpoint: "Domain model review"
gate: gate-3
---

# S3: Requirements Analysis

## 1. Identity

S3 transforms raw elicitation material into structured, unambiguous, implementation-independent analysis models and EARS requirement entries. It is the "smelting" of mined ore. S3 is NOT document formatting (S4) and NOT quality judgment against SPEC attributes (S5).

**PACT note:** S3 and S4 together fulfil ONE Rule (`raw_requirement -> specification`). The `specification` Token's ThingRef contains both the analysis model (this stage) and the specification document (S4). The participant is the same (`requirements_engineer`).

## 2. PACT Operation

```
Rule-P: raw_requirement -> specification   (sub-step 1 of 2)
Participant: requirements_engineer
Gate: reads raw_requirement, consumes raw_requirement, produces specification
Precond: raw_requirement ∈ Counter
```

- Consumption of `raw_requirement` is explicit; producing the full `specification` Token waits until S4 completes its sub-step (the Token is produced once, with both parts).
- **Zero Implicit Actions:** completing S3 does not auto-run S4; the engineer proceeds explicitly.
- **Standalone mode:** linear hand-off from S2 material; identical content steps.

## 3. Input Contract

From `raw_requirement_artifact.json` (+ `business_goal_artifact.json` for tracing):

| Input | Required for |
|:---|:---|
| raw_requirements[] (classified, traceable, leak-cleaned) | all steps |
| business_goals[] | traces_to_goal validation |
| problem_frame_analysis (from S1) | domain model seeding: frames identify candidate domains |
| conflict_flags (all resolved/escalated) | precondition check |

**Blocking conditions:** any conflict still `escalated` without human resolution → STOP (analysis on unresolved conflict fabricates decisions). Any item with empty traces_to_goal → return to S2.

## 4. Step List

### Step 1: Domain Entity Identification

- **Operation:** Extract business entities from raw requirements and the problem-frame domains. Use the frame classification as a seed: each causal/lexical/biddable domain typically yields entities. Name entities in business vocabulary only — no technical naming (no table names, class names, service names).
- **Output:** entity list with business definitions.
- **Completion criterion:** every entity has a one-sentence business definition and appears in ≥1 raw requirement (no speculative entities).
- **Failure handling:** entity suggested by pattern but unsupported by material → do not add; record as open_issue.

### Step 2: Glossary Construction (closed vocabulary)

- **Operation:** For each entity and key term record: term, definition, synonyms, anti_patterns (technical words that must NOT be used for this concept). This glossary is the project's Ubiquitous Language seed.
- **Output:** glossary entries.
- **Completion criterion:** no term has two meanings; no concept has two names (if found, pick one, record the other as deprecated synonym).
- **Failure handling:** irreconcilable terminology conflict between stakeholders → open_issue + human checkpoint.

### Step 3: State Machine Extraction

- **Operation:** For entities with lifecycle (orders, approvals, tickets, accounts) extract: states, transitions {from, to, trigger, guard, action}, and exceptions. Mandatory probes: timeout paths, failure paths, cancellation, "what if the trigger never arrives?"
- **Output:** state_machines[] per lifecycle entity.
- **Completion criterion:** every state reachable; no dead-end state without explicit terminal semantics; every identified exception path has recovery defined or is flagged open_issue.
- **Failure handling:** ambiguous transition → flag, do not guess guard conditions.

### Step 4: Decision Table Generation

- **Operation:** For rule-dense material (pricing, eligibility, risk, compliance) build condition-action tables: enumerate conditions, enumerate actions, fill rules, then run conflict detection (same condition set → different actions) and completeness check (missing condition combinations → explicit default or flag).
- **Output:** decision_tables[] with conflicts_detected flag.
- **Completion criterion:** no unresolved rule conflict; every combination either has an action or an explicit "no action / reject" default.
- **Failure handling:** conflicting rules from different sources → route to conflict-resolution method; human adjudication if unresolvable.

### Step 5: EARS Conversion

- **Operation:** Convert every raw requirement into exactly one of the five EARS patterns (templates verbatim from `../methods/ears-syntax.md` §4; combinations per §5):
  - Ubiquitous: `The <system> shall <response>`
  - Event-driven: `WHEN <trigger> the <system> shall <response>`
  - Unwanted behaviour: `IF <condition>, THEN the <system> shall <response>`
  - State-driven: `WHILE <state> the <system> shall <response>`
  - Optional feature: `WHERE <feature> the <system> shall <response>`
  Splitting rule: one independently verifiable business behaviour per statement (EARS paper pattern 3: separation of complex triggers into atomic requirements — see `../methods/ears-syntax.md` §7). Negative material (S2 Step 3) becomes Unwanted-behaviour entries.
- **Output:** ears_requirements[] entries {id, type, statement, rationale, traces_to_goal, source_requirement}.
- **Completion criterion:** every entry matches exactly one pattern (validated by `../validators/ears_regex.yaml`); every raw requirement maps to ≥1 EARS entry or is explicitly dropped with rationale.
- **Failure handling:** raw item that fits no pattern → re-examine for missing context; if still unconvertible → open_issue, do not force-fit.

### Step 6: Implementation Leak Re-scan

- **Operation:** Scan all EARS statements and models against `../validators/implementation_leak_terms.yaml`; apply abstraction rewrite (`../methods/implementation-neutrality.md` §6). Model-level check: state machine actions and decision-table actions must be business actions, not technical operations.
- **Output:** cleaned entries; leak log appended.
- **Completion criterion:** zero leak terms in any artifact field.
- **Failure handling:** mandated technology constraint → move to constraints with authority source, per implementation-neutrality §7.

### Step 7: Consistency Detection

- **Operation:** Cross-check: (a) EARS entries vs state machines (trigger/guard consistency), (b) EARS entries vs decision tables (no rule contradicted), (c) entries against each other (contradictory responses to same trigger), (d) entries vs S1 world properties W (entailment sanity per `../methods/problem-statement.md` §3.1).
- **Output:** open_issues[] with contradiction descriptions.
- **Completion criterion:** every contradiction either resolved (with rationale) or escalated.
- **Failure handling:** agent never silently resolves a semantic contradiction; structure it and escalate.

### Step 8: Traceability Binding

- **Operation:** Set traces_to_goal on every EARS entry; verify no orphans (every entry links upward; every business_goal has ≥1 entry). Record source_requirement (raw item id) on every entry.
- **Output:** complete trace fields.
- **Completion criterion:** orphan count = 0.
- **Failure handling:** orphan entry → candidate for removal (gold-plating guard) or missing-goal flag; decide at human checkpoint.

## 5. Output Contract

`analysis_model` part of `SpecificationArtifact` (schema: `../validators/schemas/specification_artifact.json`):

| Field | Content |
|:---|:---|
| domain_model.entities[] | {name, attributes[], relationships[]} — business names only |
| domain_model.glossary[] | {term, definition, synonyms[], anti_patterns[]} |
| state_machines[] | {entity, states, transitions[], exceptions[]} |
| decision_tables[] | {rule_set, conditions, actions, rules[], conflicts_detected} |
| ears_requirements[] | {id, type, statement, rationale, traces_to_goal, source_requirement} |
| open_issues[] | unresolved contradictions, gaps, escalations |

## 6. Gate Checklist (gate-3)

- [ ] G3.1 All EARS entries pass `ears_regex.yaml` (exactly one pattern each)
- [ ] G3.2 Domain model contains zero technical terms (validator scan + glossary anti_patterns check)
- [ ] G3.3 Every state machine covers exception/timeout paths
- [ ] G3.4 Every decision table conflict-free (or conflicts escalated with record)
- [ ] G3.5 Zero orphan EARS entries; every entry has traces_to_goal and source_requirement
- [ ] G3.6 All S2 negative material represented as Unwanted-behaviour entries or explicitly waived
- [ ] G3.7 Consistency check complete; contradictions resolved or escalated
- [ ] G3.8 **Human checkpoint: domain expert reviews models and confirms correctness**

## 7. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| Database-shaped domain model | Entity "user_table" with FK attributes | Business naming: entity "Customer"; relationships in business terms |
| Happy-path state machines | Order: created → paid → shipped (no cancellation/timeout) | Mandatory exception/timeout probe per Step 3 |
| Compound EARS statements | "The system shall validate and assign and notify" | Split: one verifiable behaviour per statement |
| Forced pattern fit | Unwanted behaviour written as Ubiquitous | If no pattern fits cleanly, context is missing — open_issue |
| Agent invents guard conditions | "IF balance > 0" not stated by any stakeholder | Guards come from material or open_issue; never invented |

## 8. Human Checkpoint & Co-Creation Loop

```
Agent Draft (models + EARS draft entries)
   → Human Review (domain expert checks entities, states, rules; confirms or corrects)
   → Agent Refine (apply corrections; re-run validators)
   → Quality Gate (gate-3)
   → PASS: proceed to S4 sub-step / FAIL: loop back (max 3 rounds)
```

After 3 failed rounds: escalate with full model + issue list; common root causes are unstable raw material (return to S2) or missing domain expert access.

**After Gate-3:** hand over to S4 (same Rule). The `specification` Token is NOT yet produced — it is produced when S4's Gate-4 passes.
