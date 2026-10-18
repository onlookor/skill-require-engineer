---
module: conflict-resolution
grounding: verbatim
source: >
  Primary: Wiegers, K., & Beatty, J. (2013). Software Requirements, 3rd Edition. Microsoft Press.
  Chapter 5: Establishing the business requirements; Chapter 6: Finding the voice of the user.
  Secondary: Robertson, J., & Robertson, S. (2012). Volere Requirements Specification Template, Edition 16. Atlantic Systems Guild.
  Tertiary: Robertson, J., Robertson, S., & Reed, A. (2024). Mastering the Requirements Process, 4th Edition. Addison-Wesley. Ch.14 value-based negotiation.
pdf_ref:
  - "Software Requirements 3rd Edition (Karl Wiegers, Joey Beatty).pdf"
  - "Volere Requirements Specification Template edition 16 (James Robertson Suzanne Robertson).pdf"
  - "Mastering the Requirements Process, 4th Edition - James Robertson & Suzanne Robertson & Adrian Reed (calibre converted).pdf"
parse_cache:
  - "_parse_cache/wiegers.md"
  - "_parse_cache/volere.md"
  - "_parse_cache/robertson.md"
page_refs:
  conflicting_business_requirements: "Wiegers Ch.5 pp.80-81"
  resolving_conflicting_requirements: "Wiegers Ch.6 pp.116-117"
  stakeholder_conflicts: "Wiegers Ch.2 p.29"
  decision_makers: "Wiegers Ch.3 p.56"
  renegotiate_commitments: "Wiegers Ch.3 p.56"
  volere_stakeholder_agreement: "Volere V16 §2 Stakeholders, internal p.10"
  volere_user_priority_conflict: "Volere V16 §2f Priorities Assigned to Users, internal pp.13-14"
  volere_ots_conflict: "Volere V16 §3d Off-the-Shelf Software, internal pp.18-19"
  volere_environment_conflict: "Volere V16 §20a Effects on the Current Environment, internal pp.68-69"
  volere_conflicts_field: "Volere V16 requirement template example, internal p.42"
  robertson_value_negotiation: "Robertson 4th Ch.14, printed p.1040"
---

# Conflict Resolution — Identifying and Resolving Requirements Conflicts

## 1. Purpose

This module defines methods for identifying and resolving conflicts among requirements, stakeholders, and business objectives. It answers three questions:

1. What types of requirements conflicts exist?
2. Who resolves them and by what rules?
3. What techniques are available for resolution?

> Grounding note: Wiegers & Beatty (2013) provides a structured conflict taxonomy and resolution table (Ch.5-6). The Volere Requirements Specification Template, Edition 16 (Robertson & Robertson 2012) contributes verbatim conflict provisions at §2 (stakeholder conflict agreement), §2f (user priority precedence), §3d (conflicts with off-the-shelf software), §20a (early discovery of environmental conflicts), and the requirement template's `Conflicts:` field. Robertson et al. (2024) Ch.14 contributes value-based negotiation. All upgraded from L2 to L1 on 2026-09-01 after direct verification against the Volere template text.

## 2. Types of Requirements Conflicts

### 2.1 Conflicting business requirements (stakeholder-level)

**Source:** Wiegers & Beatty (2013), Ch.5, pp.80-81.

"Business requirements collected from multiple sources might conflict." (p.80)

Example: a kiosk used by retail customers. "The customer wants to spend less time purchasing goods and services, but the retailer would prefer to have customers linger in the store and spend more money. The tension among stakeholders with different goals and constraints can lead to clashing business requirements." (pp.80-81)

Key principle: "The project's decision makers must resolve these conflicts before the analyst can detail the [system's] requirements. The focus should be on delivering the maximum business value to the primary stakeholders." (p.81)

### 2.2 Conflicting requirements between user classes

**Source:** Wiegers & Beatty (2013), Ch.6, pp.116-117.

"Someone must resolve conflicting requirements from different user classes, reconcile inconsistencies, and arbitrate questions of scope that arise." (p.116)

### 2.3 Stakeholder conflicts (organizational/political)

**Source:** Wiegers & Beatty (2013), Ch.2, p.29.

"Conflicts can arise among project stakeholders. Business requirements sometimes reflect organizational strategies or budgetary constraints that aren't apparent to users. Users who are upset about having a new information system forced on them by management might not want to work with the software developers, viewing them as the harbingers of an undesired future. Such folks are sometimes called 'loser groups' (Gause and Weinberg 1989)."

### 2.4 Requirements vs. ready-made solution conflicts

**Source:** Robertson & Robertson (2012), Volere Requirements Specification Template ed.16, §3d Off-the-Shelf Software, Considerations, internal pp.18-19.
**Grounding:** L1 verbatim

"When gathering requirements, you may discover requirements that conflict with the behaviour and characteristics of the OTS software. Keep in mind that the use of OTS software was mandated before the full extent of the requirements became known. In light of your discoveries, you must consider whether the OTS product is a viable choice. If the use of the OTS software is not negotiable, then the conflicting requirements must be discarded."

Related strategy note (same section, verbatim): "The mismatches are the requirements that you will need to specify so that you can decide whether to satisfy them by either modifying the OTS software or satisfying the requirement in another way or modifying the business requirements."

### 2.5 New system vs. existing environment conflicts

**Source:** Robertson & Robertson (2012), Volere Requirements Specification Template ed.16, §20a Effects on the Current Environment, internal pp.68-69.
**Grounding:** L1 verbatim

"The intention is to discover early any potential conflicts that might otherwise not be realized until implementation time." Content: "A description of how the new product will affect the current implementation environment. This section should also cover things that the new product should not do." Considerations: "Is it possible that the new system might damage some existing system? Can people be displaced or otherwise affected by the new system?"

Sibling provision §20b covers the same early-discovery intent for installed systems: "The intention is to make early discovery of any potential conflicts that might [otherwise not be discovered]." (internal p.69)

## 3. Who Resolves Conflicts — Decision Authority

### 3.1 Decision makers must be identified early

**Source:** Wiegers & Beatty (2013), Ch.6, p.116.

"Early in the project, determine who the decision makers will be for requirements issues... If it's not clear who is responsible for making these decisions or if the authorized individuals abdicate their responsibilities, the decisions will fall to the developers or analysts by default. Most of them don't have the necessary knowledge and perspective to make the best business decisions, though."

### 3.2 Decision hierarchy principle

**Source:** Wiegers & Beatty (2013), Ch.6, p.117.

"Decisions should be made as low in the organization's hierarchy as possible by well-informed people who are close to the issues."

### 3.3 BA role in conflict resolution

**Source:** Wiegers & Beatty (2013), Ch.5, p.81.

"A BA can help by surfacing potential areas of conflict and differing assumptions, flagging conflicting business objectives, noting when requested features don't achieve those objectives, and facilitating conflict resolution. Resolving such issues is often a political and power struggle, which lies outside the scope of this book."

### 3.4 Stakeholder conflict agreement (Volere)

**Source:** Robertson & Robertson (2012), Volere Requirements Specification Template ed.16, §2 The Stakeholders, internal p.10.
**Grounding:** L1 verbatim

The stakeholder map must record, per stakeholder/knowledge combination, "the degree of involvement", "the degree of influence", and — verbatim — "**Agreement on how to address conflicts between stakeholders who have an interest in the same knowledge**." This is a prerequisite artifact, not a resolution technique: the agreement mechanism must exist before elicitation begins.

## 4. Resolution Techniques and Rules

### 4.1 Dispute resolution table

**Source:** Wiegers & Beatty (2013), Ch.6, p.117, Table 6-3.

| Disagreement between | How to resolve (verbatim) |
|:---------------------|:--------------------------|
| Individual users | "Product champion or product owner decides" |
| User classes | "Favored user class gets preference" |
| Market segments | "Segment with greatest impact on business success gets preference" |
| Corporate customers | "Business objectives dictate direction" |
| Users and user managers | "Product owner or product champion for the user class decides" |
| Development and customers | "Customers get preference, but in alignment with business objectives" |
| Development and marketing | "Marketing gets preference" |

### 4.2 User priority as conflict resolution (Volere)

**Source:** Robertson & Robertson (2012), Volere Requirements Specification Template ed.16, §2f Priorities Assigned to Users, internal pp.13-14.
**Grounding:** L1 verbatim

User priority classes and the precedence rule (verbatim):

- **Key users:** "They are critical to the continued success of the product. Give greater importance to requirements generated by this category of user."
- **Secondary users:** "They will use the product, but their opinion of it has no effect on its long-term success. **Where there is a conflict between secondary users' requirements and those of key users, the key users take precedence.**"
- **Unimportant users:** "This category of user is given the lowest priority. It includes infrequent, unauthorized, and unskilled users, as well as people who misuse the product."

### 4.3 Value-based negotiation (Robertson)

**Source:** Robertson, Robertson & Reed (2024), Mastering the Requirements Process, 4th Edition, Ch.14, printed p.1040.
**Grounding:** L1 verbatim

"If the cost of constructing a requirement exceeds its budget, then the customer value attached to the requirement indicates how you should proceed: **High-value requirements are negotiated, while low-value requirements are discarded.**"

### 4.4 Renegotiating commitments

**Source:** Wiegers & Beatty (2013), Ch.3, p.56.

"As you incorporate new requirements into the project, evaluate whether you can still achieve the current commitments with the available resources. If not, communicate the project realities to management and negotiate new, realistically achievable commitments (Wiegers 2007; Fisher, Ury, and Patton 2011)."

### 4.5 The Volere requirement template's Conflicts field

**Source:** Robertson & Robertson (2012), Volere Requirements Specification Template ed.16, requirement template example, internal p.42.
**Grounding:** L1 verbatim

Every requirement in the Volere template carries a dedicated `Conflicts:` field alongside `Originator`, `Fit Criterion`, `Customer Satisfaction`, `Customer Dissatisfaction`, and `Dependencies`. Conflicts are recorded **per requirement at authoring time**, not only detected at review time. Agent protocol: when writing or reviewing EARS entries under the Volere template, the `Conflicts:` field must be populated — empty means "no known conflicts," and any discovered conflict must name the conflicting requirement id.

### 4.6 Cautionary principles

**Source:** Wiegers & Beatty (2013), Ch.6, pp.117-118.

"Don't justify doing whatever any customer demands because 'The customer is always right.' We all know the customer is not always right (Wiegers 2011). Sometimes, a customer is unreasonable, uninformed, or in a bad mood. The customer always has a point, though, and the software team must understand and respect that point." (p.117)

"The team needs to decide who will be making decisions on the project's requirements before they confront these types of issues. Otherwise, indecision and the revisiting of previous decisions can stall the project in endless wrangling." (p.117)

## 5. Application Protocol

### 5.1 Conflict identification checklist

For each requirement or set of requirements, check:

1. Does this requirement conflict with another requirement at the same level? (§2.2)
2. Does this requirement conflict with a higher-level business objective? (§2.1)
3. Do different stakeholders have incompatible expectations? (§2.3)
4. Does this requirement conflict with an existing system or environment constraint? (§2.5)
5. Does this requirement conflict with a selected ready-made component? (§2.4)

### 5.2 Conflict resolution procedure

1. **Identify the conflict type** using §2 taxonomy.
2. **Identify the decision authority** using §3 and Table 6-3 (§4.1).
3. **Apply the appropriate resolution rule** from §4.
4. **Document the decision** including rationale, participants, and date.
5. **If unresolved**, escalate per the project's escalation path (§3.2).
6. **Renegotiate commitments** if resolution changes scope, schedule, or budget (§4.4).

### 5.3 Agent-specific guidance

- When reviewing requirements for consistency (see `./specification-quality.md` §3), flag any pair of requirements that contradict each other.
- When a conflict involves business objectives, defer to the project's decision makers; do not attempt to resolve political conflicts autonomously.
- Use the dispute resolution table (§4.1) as the primary lookup for determining who decides.
- If Volere-sourced guidance is used (§2.4, §2.5, §3.4, §4.2, §4.5), cite the Volere section number in the finding rationale.

## 6. Cross-References

- Specification quality (consistency attribute): `./specification-quality.md`
- EARS syntax (unambiguous statements reduce conflicts): `./ears-syntax.md`
- Traceability (reveals conflicts via link analysis): `./traceability.md`
- Impact analysis (changes may introduce conflicts): `./impact-analysis.md`
- Stage owner: `../stages/s6-management.md`
- Canonical definitions: `../kb/conflict-resolution-patterns.yaml`
