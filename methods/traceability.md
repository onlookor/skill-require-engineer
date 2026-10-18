---
module: traceability
grounding: verbatim
source: >
  Wiegers, K., & Beatty, J. (2013). Software Requirements, 3rd Edition. Microsoft Press.
  Chapter 29: Links in the requirements chain.
pdf_ref: "Software Requirements 3rd Edition (Karl Wiegers, Joey Beatty).pdf"
parse_cache: "_parse_cache/wiegers.md"
page_refs:
  definition: "Ch.29 p.491"
  four_link_types: "Ch.29 pp.491-492 (Figure 29-1)"
  motivations: "Ch.29 pp.493-494"
  traceability_matrix: "Ch.29 pp.494-495 (Table 29-1)"
  pairwise_matrices: "Ch.29 p.495 (Table 29-2)"
  cardinalities: "Ch.29 pp.495-496"
  nfr_traceability: "Ch.29 p.496 (Figure 29-3)"
  responsibility: "Ch.29 p.497"
  suspect_links: "Ch.29 pp.497-498 (Table 29-4)"
  procedure: "Ch.29 pp.498-499"
---

# Traceability — Links in the Requirements Chain

## 1. Purpose

"Requirements trace information documents the dependencies and logical links between individual requirements and other system elements. These elements include other requirements of various types, business rules, architecture and other design components, source code modules, tests, and help files." (Wiegers & Beatty 2013, Ch.29, p.491)

"Trace links allow you to follow the life of a requirement both forward and backward, from origin through implementation."

**Critical distinction:** "being traceable—having the properties to facilitate tracing—is not the same as being traced—actually having logical links between requirements and other elements recorded." (p.491)

**Preconditions for traceability (p.491):**
1. Each requirement must be "uniquely and persistently labeled so that you can refer to it unambiguously throughout the project."
2. Requirements must be written "in a fine-grained fashion, rather than creating large paragraphs containing many individual functional requirements that readers have to parse out."

## 2. The Four Types of Trace Links

**Source:** Ch.29, pp.491-492, Figure 29-1 (four types per Jarke 1998).

| # | Direction | From | To | Purpose |
|:---|:---|:---|:---|:---|
| 1 | Forward | Customer needs (business objectives, market demands, user requirements) | Requirements | "you can tell which requirements will be affected if those needs change"; a complete set "gives you confidence that the requirements set has addressed all stated customer needs" |
| 2 | Backward | Requirements | Customer needs | "identify the origin of each software requirement" |
| 3 | Forward | Requirements (functional and nonfunctional) | System elements (design components, code elements) | "determine that you've satisfied every requirement because you know which design components and code elements address each one" |
| 4 | Backward | Product elements | Requirements | "you know why each element was created" |

**Orphan detection (p.492):** "Suppose a tester encounters unexpected functionality with no corresponding written requirement. This code could indicate that a developer implemented a legitimate implied or verbally communicated requirement... Alternatively, it might be 'orphan code,' an instance of gold-plating that doesn't belong in the product."

Conversely: "tests that are derived from—and traced back to—individual requirements provide a mechanism for detecting unimplemented requirements."

## 3. Motivations for Tracing

**Source:** Ch.29, pp.493-494.

| Motivation | How tracing helps (verbatim summary) |
|:---|:---|
| **Finding missing requirements** | "Look for business requirements that don't trace to any user requirements, and user requirements that don't trace to any functional requirements." |
| **Finding unnecessary requirements** | "Look for any functional requirements that don't trace back to user or business requirements and therefore might not be needed." |
| **Certification and compliance** | "demonstrate that all requirements were implemented... Trace information demonstrates that requirements demanded for regulatory compliance have been included and addressed" |
| **Change impact analysis** | "Without trace information, there's a good chance that you'll overlook a system element that would be affected if you add, delete, or modify a particular requirement." |
| **Maintenance** | "Reliable trace information facilitates your ability to make changes correctly and completely during maintenance." |
| **Project tracking** | "Absent links indicate work products that have not yet been created." |
| **Reengineering** | "list the functions in an existing system you're replacing and trace them to where they are addressed in the new system's requirements and software components." |
| **Reuse** | "identifying packages of related requirements, designs, code, and tests." |
| **Testing** | "When a test fails, the links between tests, requirements, and code point developers toward likely areas to examine for the defect." |

**Discipline warning (p.493):** "Keeping the link information current as the system undergoes development and maintenance takes discipline and time. If the trace information becomes obsolete, you'll probably never reconstruct it. Obsolete or inaccurate trace data wastes time by sending developers and maintainers down the wrong path, destroying any trust the developers might have had in the information."

**Cost rule (p.493):** "On many projects, you can gain most of the traceability benefits you want for just a fraction of the potential effort... Perform a cost-benefit analysis to decide which links will contribute to the success of your project... Don't ask team members to spend time recording information unless you know how they can use it."

## 4. Traceability Matrix Formats

### 4.1 Single matrix

**Source:** Ch.29, pp.494-495, Table 29-1.

Columns: `User requirement | Functional requirement | Design element | Code element | Test`

"Table 29-1 shows how each functional requirement is linked backward to a specific use case and forward to one or more design, code, and test elements. A design element can be something like an architectural component, a table in a relational data model, or an object class. Code references can be class methods, stored procedures, source code file names, or modules within a source file."

**Fill rule (p.495):** "Fill in the information as the work gets done, not as it gets planned." A populated cell indicates work that's been completed.

⚠️ "Listing the test cases for each requirement does not indicate that the software has passed those tests. It simply indicates that certain tests have been written... Tracking testing status is a separate matter." (p.495)

### 4.2 Pairwise matrices

**Source:** Ch.29, p.495, Table 29-2.

"Another way to represent trace information is through a set of matrices that define links between pairs of system elements", e.g. one type of requirement ↔ same type, ↔ other type, ↔ tests.

Possible relationships between pairs: "specifies/is specified by," "is dependent on," "is parent of," "constrains/is constrained by" (Sommerville and Sawyer 1997).

### 4.3 Link cardinalities

**Source:** Ch.29, pp.495-496.

- **One-to-one:** "One design element is implemented in one code module."
- **One-to-many:** "One functional requirement is verified by multiple tests."
- **Many-to-many:** "Each use case leads to multiple functional requirements, and certain functional requirements are common to several use cases... in practice, many-to-many trace relationships become complex and difficult to manage."

### 4.4 Nonfunctional requirement traceability

**Source:** Ch.29, p.496, Figure 29-3.

"Nonfunctional requirements such as quality attributes often do not trace directly into code. A response-time requirement might dictate the use of certain hardware, algorithms, database structures, and architectural approaches... In those cases, you can trace the corresponding functional requirements backward to their parent nonfunctional requirement and forward into downstream deliverables as usual."

## 5. Suspect Links and Responsibility

**Source:** Ch.29, pp.497-498.

"Some tools automatically flag a trace link as being suspect whenever the object on either end of the link is modified... The suspect link indicators tell you to check whether [affected requirements] need to be changed to remain consistent with the modified [upstream artifact]. After making any necessary changes, you clear the suspect link indicators manually. This process helps ensure that you've accounted for the known ripple effects of a change."

⚠️ Trap (p.497): "Gathering and managing requirements trace data must be made the explicit responsibility of certain individuals or it won't happen. Typically, a business analyst or a quality assurance engineer collects, stores, and reports on the trace information."

## 6. The Nine-Step Traceability Procedure

**Source:** Ch.29, pp.498-499 (verbatim sequence).

1. Educate the team and management about concepts, importance, objectives, storage location, and techniques. Get commitment.
2. Select the link relationships to define. "Don't try to do all of these at once! You'll be overwhelmed."
3. Choose matrix type (single or several) and storage mechanism (text table, spreadsheet, or — much better — a requirements management tool).
4. Identify the parts of the product to trace first: "critical core functions, the high-risk portions, or the portions that you expect will undergo the most maintenance."
5. Identify who supplies each type of link information and who coordinates (most likely a BA).
6. Modify development procedures to remind developers to update links after implementing a requirement or approved change.
7. Define labeling conventions for unique identifiers.
8. Accumulate trace information as small bodies of work complete — ongoing, not at milestones.
9. Audit periodically: "If a requirement is reported as implemented and verified, yet its trace data is incomplete or inaccurate, your requirements tracing process isn't working as intended."

**Legacy system note (p.499):** "You'll never reconstruct a complete requirements traceability matrix, but this small amount of effort might make it easier the next time someone needs to work on that same part of the system."

## 7. Application Protocol (for this skill)

### 7.1 Traceability matrix maintained at Stage 4 (Specification)

```yaml
traceability_matrix:
  - business_goal_id: <from S1 BusinessGoalArtifact>
    user_requirement_ids: [<from S2 RawRequirementArtifact>]
    system_requirement_ids: [<EARS requirement IDs from S3/S4>]
    acceptance_spec_ids: [<Given-When-Then IDs from S5>]   # filled at validation
    design_element_ids: []      # filled by downstream Architecture phase (out of this skill's scope)
    code_element_ids: []        # filled by downstream Implementation phase (out of scope)
```

### 7.2 Audit checks (Stage 5 + Stage 6)

1. **Missing requirements check:** every business_goal has ≥1 user_requirement; every user_requirement has ≥1 system_requirement (EARS entry).
2. **Orphan check:** every EARS entry traces backward to a user_requirement and a business_goal. Orphans → Blocking finding.
3. **Unnecessary requirements check:** any EARS entry without an upward trace → candidate for removal (gold-plating guard).
4. **Coverage check (link type 3 forward):** every EARS entry with an acceptance spec is linked to it; entries without any acceptance spec → Blocking at baseline.
5. **Suspect-link protocol:** when any artifact changes, mark all links touching it as suspect; re-verify and clear manually.

### 7.3 What this skill does NOT trace

- Links to design elements, code modules: belong to downstream phases (Architecture, Implementation) in the lifecycle PACT instance. The skill reserves the columns but never fills them with guessed content.

## 8. Cross-References

- Stage owners: `../stages/s4-specification.md` (matrix creation), `../stages/s5-validation.md` (audit), `../stages/s6-management.md` (change-time suspect links)
- Companion: `./impact-analysis.md` (traceability is its prerequisite — "change impact analysis is easier if you have a road map")
- Quality attribute: `./specification-quality.md` §3 (Traceable collection attribute)
- Canonical definitions: `../kb/traceability-patterns.yaml`
