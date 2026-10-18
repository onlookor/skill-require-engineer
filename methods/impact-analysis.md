---
module: impact-analysis
grounding: verbatim
source: >
  Wiegers, K., & Beatty, J. (2013). Software Requirements, 3rd Edition. Microsoft Press.
  Chapter 28: Change happens; Chapter 29: Links in the requirements chain.
pdf_ref: "Software Requirements 3rd Edition (Karl Wiegers, Joey Beatty).pdf"
parse_cache: "_parse_cache/wiegers.md"
page_refs:
  why_manage_changes: "Ch.28 pp.471-473"
  scope_creep: "Ch.28 pp.472-473"
  change_control_policy: "Ch.28 p.473"
  change_control_process: "Ch.28 pp.474-478"
  ccb_definition: "Ch.28 pp.480-481"
  ccb_roles: "Ch.28 p.476"
  renegotiating_commitments: "Ch.28 p.481"
  impact_analysis_procedure: "Ch.28 pp.484-487"
  impact_analysis_template: "Ch.28 p.488"
  traceability_enables_impact: "Ch.29 pp.491-494"
---

# Change Impact Analysis — Process, Roles, and Traceability Dependency

## 1. Purpose

This module defines the change impact analysis method as described in Wiegers & Beatty (2013). It answers four questions:

1. Why must changes be managed rather than accepted ad hoc?
2. What is the change control process and who participates?
3. How is impact analysis performed step by step?
4. How does traceability enable effective impact analysis?

## 2. Why Manage Changes — The "No Free Changes" Principle

**Source:** Wiegers & Beatty (2013), Ch.28, pp.471-473.

Change is necessary and inevitable: "It's virtually impossible to define all of a product's requirements up front. The world changes as development progresses: new market opportunities arise, regulations and policies change, and business needs evolve." (p.471)

However, **"change always has a price."** (p.472) Even a rejected change request consumes time to submit, evaluate, and decide. Uncontrolled change leads to:

- Project chaos, schedule slips, quality problems, and hard feelings (p.471)
- Documented requirements becoming "an inaccurate representation of what the product does" (p.472)
- Brittle code when "changes are made without respecting the architecture and design structure" (p.472)
- Unplanned rework of test procedures and user documentation (p.472)

The principle is stated explicitly: **"Ignoring the price doesn't alter the fact that change is not free."** (p.473)

Five conditions an organization must ensure (p.471):

1. "Proposed requirements changes are thoughtfully evaluated before being committed to."
2. "Appropriate individuals make informed business decisions about requested changes."
3. "Change activity is made visible to affected stakeholders."
4. "Approved changes are communicated to all affected participants."
5. "The project incorporates requirements changes in a consistent and effective fashion."

### 2.1 Scope creep

**Source:** Wiegers & Beatty (2013), Ch.28, pp.472-473.

"Scope creep, in which the project continuously incorporates more functionality without adjusting resources, schedules, or quality goals, is insidious. The problem is not that requirements change but that late changes can have a big impact on work already performed." (p.473)

"The most effective technique for controlling scope creep is the ability to say 'no'" (Weinberg 1995, cited p.473). "'Not now' is more palatable than a simple rejection. It holds the promise of including the feature in a subsequent release." (p.473)

## 3. Change Control Policy

**Source:** Wiegers & Beatty (2013), Ch.28, p.473.

Five policy statements (verbatim):

1. "All changes must follow the process. If a change request is not submitted in accordance with this process, it will not be considered."
2. "No design or implementation work other than feasibility exploration will be performed on unapproved changes."
3. "Simply requesting a change does not guarantee that it will be made. The project's change control board (CCB) will decide which changes to implement."
4. "The contents of the change database must be visible to all project stakeholders."
5. **"Impact analysis must be performed for every change."**

## 4. The Change Control Process

**Source:** Wiegers & Beatty (2013), Ch.28, pp.474-478.

"A sensible change control process lets the project's leaders make informed business decisions that will provide the greatest customer and business value while controlling the product's life-cycle cost and the project's schedule." (p.474)

Key principle: "A change control process is not an obstacle to making necessary modifications. It's a funneling and filtering mechanism to ensure that the project expeditiously incorporates the most appropriate changes." (pp.474-475)

### 4.1 Process description components

Every change control process description should include four components (p.475):

1. **Entry criteria** — "the conditions that must be satisfied before the process execution can begin"
2. **Tasks** — "the various tasks involved in the process, the project role responsible for each task, and other participants in the task"
3. **Verification steps** — "steps to verify that the tasks were completed correctly"
4. **Exit criteria** — "the conditions that indicate when the process is successfully completed"

### 4.2 Process tasks (sequential steps)

| Step | Task | Description (verbatim summary) | Source |
|:-----|:-----|:-------------------------------|:-------|
| 1 | Evaluate change request | "Begin by evaluating the request for technical feasibility, cost, and alignment with the project's business requirements and resource constraints. The CCB Chair might assign an Evaluator to perform impact analysis, risk and hazard analysis, or other assessments." | Ch.28 p.476 |
| 2 | Make change decision | "The appropriate decision makers, chartered as the CCB, then decide whether to approve or reject the change. The CCB gives each approved change a priority or target implementation date, or it allocates the change to a specific iteration or release." | Ch.28 p.476 |
| 3 | Implement the change | "The assigned Modifier (or Modifiers) updates the affected work products as necessary to fully implement the change. Use requirements trace information to find all the parts of the system that the change touches, and revise the trace information if necessary." | Ch.28 p.476 |
| 4 | Verify the change | "Requirements changes typically are verified through a peer review to ensure that modified deliverables correctly address all aspects of the change. Multiple team members might verify the changes made in various downstream work products through testing or review." | Ch.28 p.476 |

### 4.3 Entry and exit criteria

**Entry criterion** (p.476): "A change request with all the necessary information has been received through an approved channel."

**Exit criteria** (p.478):
- "The status of the request is Rejected, Closed, or Canceled."
- "All modified work products are updated and stored in the correct locations."
- "The relevant stakeholders have been notified of the change details and the status of the change request."

## 5. The Change Control Board (CCB)

**Source:** Wiegers & Beatty (2013), Ch.28, pp.480-481.

### 5.1 Definition

"The change control board is the body of people—whether it is one individual or a diverse group—that decides which proposed changes and new requirements to accept, which to accept with revisions, and which to reject. The CCB also decides which reported defects to correct and when to correct them." (p.480)

"Projects always have some de facto group that makes change decisions. Establishing a CCB formalizes this group's composition and authority and defines its operating procedures." (p.480)

### 5.2 CCB roles

**Source:** Wiegers & Beatty (2013), Ch.28, p.476, Table 28-1.

| Role | Description (verbatim) |
|:-----|:----------------------|
| CCB Chair | "Chairperson of the change control board; generally has final decision-making authority if the CCB does not reach agreement; identifies the Evaluator and the Modifier for each change request" |
| CCB | "The group that decides to approve or reject proposed changes for a specific project" |
| Evaluator | "Person whom the CCB Chair asks to analyze the impact of a proposed change" |
| Modifier | "Person who is responsible for making changes in a work product in response to an approved change request" |
| Originator | "Person who submits a new change request" |
| Request Receiver | "Person who initially receives newly submitted change requests" |
| Verifier | "Person who determines whether the change was made correctly" |

### 5.3 CCB composition

Representatives from (p.480): project/program management, business analysis/product management, development, testing/QA, marketing/business/customer representatives, technical support/help desk.

"Keep the CCB small so the group can respond promptly and efficiently to change requests." (p.481)

### 5.4 Decision-making

"The CCB balances the anticipated benefits against the estimated impact of accepting a proposed change. Benefits from improving the product could include financial savings, increased revenue, higher customer satisfaction, and competitive advantage. Possible negative impacts include increased development and support costs, delayed delivery, and degraded product quality." (p.481)

### 5.5 Renegotiating commitments

**Source:** Wiegers & Beatty (2013), Ch.28, p.481.

"Stakeholders can't stuff more and more functionality into a project that has schedule, staff, budget, or quality constraints and still expect to succeed. Before accepting a significant requirement change, renegotiate commitments with management and customers to accommodate the change."

## 6. Change Impact Analysis Procedure

**Source:** Wiegers & Beatty (2013), Ch.28, pp.484-487.

"Impact analysis is a key aspect of responsible requirements management (Arnold and Bohner 1996). It provides an accurate understanding of the implications of a proposed change, which helps the team make informed business decisions about which proposals to approve." (p.484)

**Critical warning:** "Skipping impact analysis doesn't change the size of the task. It just turns the size into a surprise. Software surprises are rarely good news." (p.485)

### 6.1 Three-step impact analysis

"The CCB Chair will ask one or more technical people (business analysts, developers, and/or testers) to perform the impact analysis for a specific change proposal. Impact analysis involves three steps:" (p.484)

1. **"Understand the possible implications of making the change.** A requirement change often produces a large ripple effect, leading to modifications in other requirements, architectures, designs, code, and tests. Changes can lead to conflicts with other requirements or can compromise quality attributes, such as performance or security." (pp.484-485)

2. **"Identify all the requirements, files, models, and documents that might have to be modified** if the team incorporates the requested change." (p.485)

3. **"Identify the tasks required to implement the change, and estimate the effort needed** to complete those tasks." (p.485)

### 6.2 Detailed estimation procedure (8 steps)

**Source:** Wiegers & Beatty (2013), Ch.28, pp.485-486.

| Step | Action |
|:-----|:-------|
| 1 | Work through the implications checklist (Figure 28-5) |
| 2 | Work through the affected-work-products checklist (Figure 28-6); RM tools can follow traceability links |
| 3 | Use the effort estimation worksheet (Figure 28-7) to estimate effort for anticipated tasks |
| 4 | Sum the effort estimates |
| 5 | Identify the sequence in which tasks must be performed and how they interleave with planned tasks |
| 6 | Estimate the impact on the project's schedule and cost |
| 7 | Evaluate the change's priority compared to other pending requirements |
| 8 | Report the impact analysis results to the CCB |

"In most cases, this procedure shouldn't take more than a couple of hours to complete for a single change request." (p.486)

### 6.3 Improving future impact analysis

"To improve your future impact analysis, compare the actual effort needed to implement each change with the estimated effort. Understand the reasons for any differences, and modify the impact estimation checklists and worksheet to help ensure that future impact analyses are more accurate." (p.486)

### 6.4 Impact analysis template outputs

**Source:** Wiegers & Beatty (2013), Ch.28, p.488.

The impact analysis report (Figure 28-8) provides a summary for the CCB. The implementers need the full analysis details and effort planning worksheet; the CCB needs only the summary.

## 7. Traceability As the Enabler of Impact Analysis

**Source:** Wiegers & Beatty (2013), Ch.29, pp.491-494.

"Change impact analysis is easier if you have a road map that shows where each requirement or business rule was implemented in the software." (p.491)

"Trace information facilitates impact analysis by helping you identify all the work products you might have to modify to implement a proposed requirement change." (p.491)

Without traceability: **"Without trace information, there's a good chance that you'll overlook a system element that would be affected if you add, delete, or modify a particular requirement."** (p.494)

Four types of trace links (Jarke 1998, cited p.491):
1. Customer needs → requirements (forward)
2. Requirements → customer needs (backward)
3. Requirements → downstream deliverables (design, code, tests)
4. Product elements → requirements (backward from implementation)

## 8. Application Protocol

### 8.1 When a change request arrives

1. Verify entry criteria: request submitted through approved channel with all necessary information.
2. CCB Chair assigns an Evaluator.
3. Evaluator performs the three-step impact analysis (§6.1).
4. Evaluator follows the 8-step estimation procedure (§6.2) using checklists and trace data.
5. Evaluator reports results to CCB using the impact analysis template (§6.4).
6. CCB makes informed decision: approve, reject, or approve with revisions.
7. If approved: assign Modifier, implement, verify, update traces.
8. If rejected: document rationale, notify Originator.
9. Verify exit criteria (§4.3).

### 8.2 Agent-specific guidance

- When asked to assess a proposed requirement change, always produce an impact analysis following §6.1-6.2 before recommending approval.
- Use traceability data from `./traceability.md` to identify affected artifacts.
- Flag any change that lacks trace coverage as high-risk: "Without trace information, there's a good chance that you'll overlook a system element." (Ch.29 p.494)
- Never skip impact analysis regardless of perceived simplicity: "Skipping impact analysis doesn't change the size of the task. It just turns the size into a surprise." (Ch.28 p.485)

## 9. Cross-References

- Traceability method: `./traceability.md`
- Stage owner: `../stages/s6-management.md`
- Canonical definitions: `../kb/impact-analysis-patterns.yaml`
- Specification quality (consistency attribute): `./specification-quality.md`
