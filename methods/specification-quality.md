---
module: specification-quality
grounding: verbatim
source: >
  Primary: Martinelli, S. (2025). Spec-Driven Development: From Specs to Code with AI Agents. Apress.
  Chapters 3 (Human Review As the Critical Quality Gate), 4 (Writing Executable Specifications), 6 (Coverage As Specification Completeness).
  Secondary: Wiegers, K., & Beatty, J. (2013). Software Requirements, 3rd Edition. Microsoft Press. Chapter 11: Writing excellent requirements.
pdf_ref:
  - "Spec-Driven Development From Specs to Code with AI Agents (Simon Martinelli).pdf"
  - "Software Requirements 3rd Edition (Karl Wiegers, Joey Beatty).pdf"
parse_cache:
  - "_parse_cache/martinelli.md"
  - "_parse_cache/wiegers.md"
page_refs:
  review_gate_attributes: "Martinelli Ch.3 pp.50-51"
  executable_tests: "Martinelli Ch.4 pp.65-66"
  observable_behavior: "Martinelli Ch.4 pp.66-67"
  ambiguity: "Martinelli Ch.4 pp.68-69"
  one_rule_per_statement: "Martinelli Ch.4 pp.70-71"
  coverage_completeness: "Martinelli Ch.6 pp.112-113"
  wiegers_statement_attrs: "Wiegers Ch.11 pp.203-204"
  wiegers_collection_attrs: "Wiegers Ch.11 pp.204-205"
supersedes: "spec7-quality (planned name dropped — 'SPEC-7' does not exist in any source; see PROGRESS.md)"
---

# Specification Quality — Attributes, Review Gate, Executability

## 1. Purpose

This module defines the quality bar for requirements and specifications, used by Stage 5 (Validation) and Review Mode. It answers three questions:

1. What attributes must an individual requirement statement exhibit?
2. What attributes must the requirements set as a whole exhibit?
3. What makes a specification *executable* rather than merely readable?

> ⚠️ Naming note: earlier planning referenced a "SPEC-7" quality model. That name does not appear in any source book and was dropped. This module is grounded exclusively in the attributes below.

## 2. Attributes of Individual Requirement Statements

**Source:** Wiegers & Beatty (2013), Ch.11, pp.203-204.

Each requirement statement should be:

| Attribute | Definition (verbatim summary) |
|:---|:---|
| **Complete** | "Each requirement must contain all the information necessary for the reader to understand it... If you know you're lacking certain information, use TBD (to be determined) as a standard flag to highlight these gaps... Resolve all TBDs in each portion of the requirements before the developers proceed with construction of that portion." |
| **Correct** | "Each requirement must accurately describe a capability that will meet some stakeholder's need... A low-level requirement that conflicts with its parent is not correct." |
| **Feasible** | "It must be possible to implement each requirement within the known capabilities and limitations of the system and its operating environment, as well as within project constraints of time, budget, and staff." |
| **Necessary** | "Each requirement should describe a capability that provides stakeholders with the anticipated business value, differentiates the product in the marketplace, or is required for conformance to an external standard, policy, or regulation. Every requirement should originate from a source that has the authority to provide requirements." |
| **Prioritized** | "Assign an implementation priority to each functional requirement, user requirement, use case flow, or feature to indicate how essential it is to a particular product release." |
| **Unambiguous** | "Natural language is prone to two types of ambiguity. One type I can spot myself, when I can think of more than one way to interpret a given requirement. The other type... is harder to catch. That's when different people read the requirement and come up with different interpretations of it." |
| **Verifiable** | "Can a tester devise tests or other verification approaches to determine whether each requirement is properly implemented? If a requirement isn't verifiable, deciding whether it was correctly implemented becomes a matter of opinion, not objective analysis." |

**Cross-dependency:** "Requirements that are incomplete, inconsistent, infeasible, or ambiguous are also unverifiable." (p.204) — verifiability is the integrator attribute.

## 3. Attributes of Requirements Collections

**Source:** Wiegers & Beatty (2013), Ch.11, pp.204-205.

Sets of requirements grouped into a baseline should exhibit:

| Attribute | Definition (verbatim summary) |
|:---|:---|
| **Complete** | "No requirement or necessary information should be absent... Missing requirements are hard to spot because they aren't there!... Any specification that contains TBDs is incomplete." |
| **Consistent** | "Consistent requirements don't conflict with other requirements of the same type or with higher-level business, user, or system requirements. If you don't resolve contradictions between requirements before diving into construction, the developers will have to deal with them." |
| **Modifiable** | "You can always rewrite a requirement, but you should maintain a history of changes made to each requirement, especially after they are baselined... Modifiability dictates that each requirement be uniquely labeled and expressed separately from others... avoid stating requirements redundantly." |
| **Traceable** | "A traceable requirement can be linked both backward to its origin and forward to derived requirements, design elements, code that implements it, and tests that verify its implementation... Traceable requirements are uniquely labeled with persistent identifiers. They are written in a structured, fine-grained way, not in long narrative paragraphs." |

## 4. The Human Review Gate (Quality Outcome Attributes)

**Source:** Martinelli (2025), Ch.3, pp.50-51.

Human review is "the most critical step in the entire AI-assisted requirements process. AI can summarize, extract, and structure information efficiently, but it cannot take responsibility for correctness, intent, or shared understanding. Only the team can do that."

During review the team: "duplicates are merged, contradictions are resolved, missing rules are added, and unclear or ambiguous wording is rewritten. This is where assumptions are challenged and intent is made explicit."

### 4.1 Failure modes when review is skipped

Five problems appear later in the project (p.51):

1. **False confidence** — "The specification appears structured and professional, but it contains subtle misunderstandings. These errors are harder to detect later because they are now documented and implicitly trusted."
2. **Hidden contradictions** — "AI often preserves conflicting statements from different workshop inputs. Without review, these conflicts move downstream into use cases, tests, and code, where they cause inconsistent behavior."
3. **Ambiguous behavior** — "Vague wording that humans would normally clarify in conversation remains in the spec. AI will still generate code from it, but each generation may interpret the ambiguity differently."
4. **Misaligned automation** — "AI agents follow the written specification exactly. If the spec is wrong, incomplete, or unclear, the automation will reliably produce the wrong result, faster and at larger scale."
5. **Loss of shared understanding** — "The real value of requirements workshops is not the raw output but the shared mental model created during discussion."

### 4.2 Outcome definition of a reviewed requirements set

"The outcome of this step is a requirements set that is:

- Correct and unambiguous
- Shared and agreed upon
- Internally consistent
- Reviewable and version-controlled
- Safe to use as input for use cases, tests, and AI-driven code generation"

(p.51)

## 5. Executability — The Three Tests

**Source:** Martinelli (2025), Ch.4, pp.65-66.

"Executable does not mean formal notation, generated code, or machine-only syntax. It does not require a specialized modeling language. In many projects, plain Markdown is enough."

"Spec-driven development raises the quality bar: a specification must be precise enough to drive action, not just understandable enough to read." (p.65)

Three simple tests reveal whether a use case is executable (p.65):

1. "If two people read it and imagine different outcomes, it is not executable yet."
2. "If a tester cannot derive acceptance criteria from it, it is not executable yet."
3. "If an AI tool must invent missing rules to generate code, it is not executable yet."

Core principle: "a good specification removes assumptions instead of depending on them." (p.66)

## 6. Observable Behavior As the Core Principle

**Source:** Martinelli (2025), Ch.4, pp.66-67.

"The most important discipline in writing system use cases is focusing on observable behavior: what an actor does and how the system responds in ways that can be seen, verified, or tested from the outside."

A use case **should** describe:
- The actor selects a task
- The system displays the task details
- The actor chooses a target user
- The system confirms the assignment

A use case **should not** describe:
- The database transaction is opened
- A repository method is called
- A message is published internally
- The UI framework refreshes a component tree

**Practical test:** "if a statement cannot be verified by observing the system from the outside, it probably does not belong in the use case." (p.67)

This enforces the hub's Implementation Independence invariant (§4.1 of SKILL.md).

## 7. Making Specifications Unambiguous

**Source:** Martinelli (2025), Ch.4, pp.68-69.

"Ambiguity is the biggest risk in spec-driven development. AI does not create ambiguity, but it amplifies it: when a requirement or use case is vague, AI will still generate something that looks plausible and well structured, but that is based on interpretation rather than intent."

### 7.1 Banned hedging words

'Words such as **"normally," "quickly," "usually," "if possible," "as needed,"** and sometimes even **"should"** often hide decisions that have not yet been made.' (p.68)

These extend the hub's ambiguity blacklist (see `../validators/ambiguous_words.yaml`).

### 7.2 The replacement pattern

"An executable specification replaces vague wording with explicit rules. Instead of saying that the system responds quickly, it references a measurable non-functional requirement. Instead of saying that a user can assign tasks, it defines under which conditions assignment is allowed and what happens when those conditions are not met. Instead of saying that invalid input is handled appropriately, it states the observable result, such as an error message being shown and no change being persisted. **Specificity is what makes a specification strong, not abstraction.**" (p.68)

### 7.3 Worked transformation (keep as canonical example)

**Bad:** "The system should normally allow a user to assign a task to another user quickly, and handle invalid input appropriately."

"This sentence is readable, but it is not executable. It hides at least four open decisions. When does 'normally' not apply? How fast is 'quickly'? Who counts as 'another user'? What does 'appropriately' mean when input is invalid?" (p.69)

**Good:** the executable version makes each rule explicit via Precondition, Main flow, Alternative flows, Business rules (BR-012, BR-013), linked NFR (NFR-001: "Task operations must complete in under one second"), and success Postconditions. (p.69)

"The first sentence could be implemented in many different ways, all of them defensible. The second version leaves no room for interpretation. Two developers reading it will arrive at the same understanding." (pp.69-70)

## 8. One Rule per Statement

**Source:** Martinelli (2025), Ch.4, pp.70-71.

"When a sentence contains multiple decisions, it becomes harder to validate and easier to misunderstand. A sentence with 'and' or 'or' often hides separate rules that should be written independently."

Example: "The system validates the user and assigns the task." — "This combines at least two behaviors. Validation and assignment are not the same thing. They may fail for different reasons, trigger different messages, and lead to different test cases."

Split into:
1. The system validates that the selected target user is active.
2. The system assigns the task to the selected user.

Evolution rationale: "when rules are written in smaller, explicit units, later changes produce smaller diffs that are easier to review and easier to synchronize into code and tests. Specifications are not static documents; they evolve, and smaller units make that evolution manageable." (p.71)

## 9. Coverage As Specification Completeness

**Source:** Martinelli (2025), Ch.6, pp.112-113.

"Traditional test coverage asks how many lines of code were executed. That question is useful, but it is not enough. Spec-driven coverage asks a more important question: which parts of the specification are actually verified?"

"The goal is complete specification coverage. Every main success scenario should have a corresponding happy-path test. Every alternative or exception flow should be covered where it matters. Every business rule should be asserted somewhere in the suite. **An uncovered line of code may be acceptable. An uncovered business rule is a gap in the system's protection.**"

Traceability convention: "Test class names include the use case identifier and name... Test methods point to the exact flow or business rule they verify." This "shifts coverage reporting from code execution to specification verification."

## 10. Application Protocol

### 10.1 Review Mode checklist (per requirement statement)

For each requirement, verify in order and record pass/fail per attribute:

1. **Complete** — no unflagged gaps; all TBDs flagged, none unflagged.
2. **Correct** — matches an authoritative source (business goal, stakeholder statement, parent requirement).
3. **Feasible** — within known technical, time, budget constraints.
4. **Necessary** — traceable to a business objective; answer "why is this included?" exists.
5. **Prioritized** — implementation priority assigned for the release.
6. **Unambiguous** — single interpretation; no banned hedging words (§7.1); passes EARS regex validator.
7. **Verifiable** — a tester can derive a test or verification approach from it.
8. **Implementation-neutral** — passes the observable-behavior test (§6); no `[IMPLEMENTATION LEAK]`.
9. **Atomic** — one rule per statement; no hidden "and"/"or" conjunctions (§8).

### 10.2 Review Mode checklist (per requirements set)

1. **Complete** — no known missing requirements; all TBDs resolved before construction of that portion.
2. **Consistent** — no unresolved contradictions between requirements or with parent artifacts.
3. **Modifiable** — unique persistent IDs; no redundancy; change history maintained.
4. **Traceable** — backward links to origin; forward links to use cases/tests where they exist.
5. **Coverage** — every main flow has a happy-path test; every business rule asserted (§9).
6. **Review-gate outcome** — correct & unambiguous, shared & agreed, internally consistent, reviewable & version-controlled, safe as automation input (§4.2).

### 10.3 Severity rules for the review report

- **Blocking:** fails Unambiguous, Correct, Consistent, Verifiable, or triggers `[IMPLEMENTATION LEAK]`; any unflagged TBD blocking construction.
- **Non-Blocking:** style issues, missing prioritization, missing forward trace links where downstream artifacts do not yet exist.

Report format: `../validators/schemas/review_report.json`.

## 11. Cross-References

- Syntax layer: `./ears-syntax.md` (attribute 6 is enforced by `../validators/ears_regex.yaml`).
- Blacklist: `../validators/ambiguous_words.yaml`.
- Stage owner: `../stages/s5-validation.md`.
- Canonical definitions: `../kb/specification-quality-patterns.yaml`.
