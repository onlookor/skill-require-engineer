---
stage: s1
title: Business Analysis
pact_rule: "product_owner seeds business_goal (Rule-S)"
pact_participant: product_owner (seed authority) + business_analyst (content production)
methods_required: [problem-statement, implementation-neutrality, opportunity-assessment, brown-cow]
validators_required: [implementation_leak_terms, schemas/business_goal_artifact.json]
input_artifact: none (free-text business problem description)
output_artifact: schemas/business_goal_artifact.json
human_checkpoint: "Problem statement confirmation"
gate: gate-1
---

# S1: Business Analysis — Seed Content Production

## 1. Identity

S1 answers **why** the work exists and **how success will be measured**. It produces the `business_goal` Token content — the only legal entry point of the software lifecycle PACT instance. S1 is NOT elicitation of specific requirements (that is S2), and NOT solution design.

**Scope rule:** if the user's request arrives with no measurable business goal, S1 is mandatory. Never skip to S2 without Gate-1 passing.

## 2. PACT Operation

```
Rule-S: product_owner seeds business_goal
Precond(business_goal) = ∅   (source type: cannot be produced internally)
```

- `business_goal` is a **seed type**. It enters the Counter only via `product_owner` exercising Seed Authority. The agent may draft and structure the content, but the seed injection requires human (product_owner) confirmation — this is the mandatory checkpoint.
- **Zero Implicit Actions:** seeding `business_goal` does not automatically trigger S2. The transition to S2 requires the `business_analyst` participant to explicitly begin Rule-P.
- **Standalone mode:** Rule-S degrades to "the user states a business problem"; all gates still apply, but the human checkpoint becomes direct user confirmation.

## 3. Input Contract

No schema input (this stage creates the first artifact). Accepted raw inputs:

| Input | Handling |
|:---|:---|
| Free-text business problem description | Primary input; run Step 1–3 on it |
| Organizational strategy document / KPI list | Use to anchor business_goals metrics |
| A presumed solution ("we need a portal") | Treat as Future-How; trigger reverse-engineering (Step 2) |
| Empty input | STOP. Report "cannot start: no business problem provided." Do not invent content. |

## 4. Step List

### Step 1: Problem Penetration (Repeated Why)

- **Operation:** Apply the repeated-Why method from `./methods/implementation-neutrality.md` §4 to every stated need. Ask "why is this needed / what for" until the answer is free of technology and states a business outcome. Watch for the four traps: presumed solutions, technological fossils, referred pain, disguised problems (§5 of that module).
- **Output:** root-cause chain for each stated need.
- **Completion criterion:** every chain ends in a technology-free business outcome statement.
- **Failure handling:** if a chain collapses (stakeholder cannot answer why) → record as open_question; do not guess.

### Step 2: Problem Framing (Problem Frame Analysis)

- **Operation:** Apply `./methods/problem-statement.md` §7.1: identify problem_world (phenomena b the customer observes), requirement summary R, machine scope, given world properties W, and classify subproblems against the five elementary frames (required_behaviour, commanded_behaviour, workpieces, information_display, transformation). Run the entailment check S; W ⊢ R as a feasibility plausibility test.
- **Output:** `problem_frame_analysis` block (see Output Contract §5).
- **Completion criterion:** problem_world delimited; each subproblem classified; W stated or flagged unknown.
- **Failure handling:** if frame cannot be classified → mark frame: "unclassified" + open_question; escalate to human checkpoint.

### Step 3: Problem Statement (mandatory template)

- **Operation:** Compose exactly one problem statement using this template (all slots mandatory; a missing slot = incomplete, not optional):

```
For <affected group>,
in <specific context>,
the current <status quo description> causes <quantified loss/pain>.
We expect, through <desired state>, to achieve <measurable improvement target>,
thereby supporting <upper-level business goal>.
```

- **Output:** `problem_statement` string.
- **Completion criterion:** all six slots filled; loss and target are quantified (number + unit); no implementation terms (validator scan).
- **Failure handling:** if loss cannot be quantified → insert explicit "TBD (baseline unknown)" and add to open_questions; the statement then CANNOT pass Gate-1 until quantified.

### Step 4: Business Goals with Metrics

- **Operation:** For each business goal elicit: goal (business language), metric (how measured), baseline (current value), target (desired value), deadline. If an Opportunity Solution Tree is warranted (multiple candidate outcomes), structure opportunities per `./methods/opportunity-assessment.md` §5 and select the target outcome per its assessment criteria before fixing goals.
- **Output:** `business_goals` array.
- **Completion criterion:** every goal has metric + baseline + target; baseline is a real number, not an estimate labeled as fact.
- **Failure handling:** unknown baseline → goal marked with `baseline: null` and open_question raised; such goals fail Gate-1.

### Step 5: Stakeholder Map

- **Operation:** For each stakeholder role record interest, influence (high/medium/low), and hidden_knowledge (what only this role knows). Use the coverage question: "who uses it / who decides / who is affected / who might be forgotten?"
- **Output:** `stakeholder_map` array.
- **Completion criterion:** at least three distinct roles covering user, decision-maker, and affected party.
- **Failure handling:** role suspected but unreachable → record with hidden_knowledge: "unreachable" and add open_question.

### Step 6: Scope Boundary

- **Operation:** Explicitly list in_scope items, out_of_scope items, and assumptions. Classify each item against Brown Cow quadrants (`./methods/brown-cow.md`): in_scope items must be Future-What (essential); anything Future-How belongs to the downstream Architecture phase, not here.
- **Output:** `scope_boundary` object.
- **Completion criterion:** out_of_scope is non-empty (an empty out_of_scope means nothing was analyzed).
- **Failure handling:** if user refuses to exclude anything → record the refusal as an open_question and flag risk; do not proceed silently.

### Step 7: Implementation Neutrality Guard

- **Operation:** Run the full S1 output against `../validators/implementation_leak_terms.yaml`. Any hit → apply abstraction rewrite (`./methods/implementation-neutrality.md` §6.2) or move to constraints with authority rationale (§7 of that module).
- **Output:** cleaned artifact.
- **Completion criterion:** zero unexplained leak terms.
- **Failure handling:** term that cannot be abstracted and has no authority mandate → escalate to human checkpoint as an undecided constraint.

### Step 8: Assumption Marking

- **Operation:** Every unverified premise becomes an explicit assumption or open_question. Nothing uncertain may be written as fact (hub Honesty invariant).
- **Output:** assumptions list + open_questions list.
- **Completion criterion:** no statement in the artifact presents an unverified premise as confirmed.

## 5. Output Contract

`BusinessGoalArtifact` = the ThingRef of the seeded `business_goal` Token. Schema: `../validators/schemas/business_goal_artifact.json`.

| Field | Content |
|:---|:---|
| problem_statement | Step 3 template, all slots filled |
| business_goals[] | {goal, metric, baseline, target, deadline} |
| stakeholder_map[] | {role, interest, influence, hidden_knowledge} |
| scope_boundary | {in_scope, out_of_scope (≥1), assumptions} |
| success_criteria[] | business-language success definitions |
| open_questions[] | unresolved items carried to S2 |
| problem_frame_analysis | Step 2 block (world, R, machine scope, W, frame classification, entailment check) |

## 6. Gate Checklist (gate-1)

All items must be YES. "Mostly" is a NO.

- [ ] G1.1 `problem_statement` survives the repeated-Why test (five consecutive whys do not collapse into "because we said so")
- [ ] G1.2 Every `business_goal` has a quantified `baseline` AND `target`
- [ ] G1.3 `stakeholder_map` covers ≥3 roles including user + decision-maker + affected party
- [ ] G1.4 `scope_boundary.out_of_scope` is non-empty
- [ ] G1.5 Zero implementation leak terms (validator scan clean, or every hit reclassified as mandated constraint)
- [ ] G1.6 Problem frame analysis present: problem_world delimited, W stated or flagged
- [ ] G1.7 No unverified premise written as fact
- [ ] G1.8 **Human confirmation: product_owner confirms the problem definition is correct** (seed injection)

## 7. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| Solution accepted as goal | "Goal: build a knowledge base system" | Apply repeated-Why; the goal is the business outcome the system serves (e.g., reduce resolution time) |
| Unquantified pain | "Customer service is slow" | Demand baseline+target: "avg handling time 12 min → target 3 min" |
| Empty out_of_scope | "Everything is in scope" | Refuse Gate-1; force explicit exclusions |
| Symptom treated as problem | "Hire more help-desk staff" | Referred-pain check: investigate why help is needed |
| Invented baseline | Writing "baseline: 10%" without source | Mark `baseline: null` + open_question; do not fabricate |

## 8. Human Checkpoint & Co-Creation Loop

```
Agent Draft (problem frame + statement draft)
   → Human Review (product_owner checks: right problem? right metrics?)
   → Agent Refine (incorporate corrections, re-run validators)
   → Quality Gate (gate-1 checklist)
   → PASS: product_owner seeds business_goal Token / FAIL: loop back (max 3 rounds)
```

After 3 failed rounds: escalate with full context to the project lead; recommend revisiting whether a real business problem exists at all.

**After Gate-1:** `business_goal ∈ Counter`. S2 (`business_analyst`) may now begin Rule-P. This stage never auto-starts S2 (Zero Implicit Actions).
