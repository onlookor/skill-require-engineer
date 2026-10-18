---
stage: s4
title: Requirements Specification
pact_rule: "raw_requirement → specification (documentation sub-step; completes the Rule started in S3)"
pact_participant: requirements_engineer
methods_required: [ears-syntax, specification-quality, traceability]
validators_required: [ears_regex, ambiguous_words, implementation_leak_terms, schemas/specification_artifact.json]
input_artifact: "analysis_model produced by S3 (part of schemas/specification_artifact.json)"
output_artifact: "complete SpecificationArtifact (schemas/specification_artifact.json)"
human_checkpoint: "Baseline sign-off by stakeholders"
gate: gate-4
---

# S4: Requirements Specification

## 1. Identity

S4 documents the S3 analysis model into a **baseline artifact** — the contract for development, testing, and acceptance. It is the "casting" of smelted metal. S4 is NOT analysis or modeling (S3) and NOT quality judgment (S5).

**PACT note:** S4 completes the SAME Rule as S3 (`raw_requirement -> specification`). The `specification` Token's ThingRef contains both the analysis model (S3) and this documentation. The Token is produced once, after gate-4 passes.

## 2. PACT Operation

```
Rule-P: raw_requirement -> specification   (sub-step 2 of 2)
Participant: requirements_engineer
Gate: reads raw_requirement, consumes raw_requirement, produces specification
Precond: gate-3 passed (S3 complete)
```

- The `specification` Token is produced when gate-4 passes; consumption of `raw_requirement` happens at that same explicit action (Zero Implicit Actions).
- Once produced, the Token's content is a **baseline**: any later modification goes through the S6 change protocol (consume + new production), never in-place edit.
- **Standalone mode:** identical content steps; baseline marker is a version tag in the file system.

## 3. Input Contract

From S3 output (`analysis_model` part of `specification_artifact.json`) plus upstream artifacts:

| Input | Required for |
|:---|:---|
| analysis_model (entities, glossary, state machines, decision tables, EARS entries) | section population |
| business_goal_artifact (S1) | business requirements layer + upward trace |
| raw_requirement_artifact (S2) | user requirements layer |
| template choice (volere / kiro / custom) | skeleton generation |

**Blocking conditions:** gate-3 not passed → STOP. Any EARS entry failing `ears_regex` → return to S3.

## 4. Step List

### Step 1: Template Selection

- **Operation:** Select the SRS skeleton:
  - **volere (default):** Volere Requirements Specification Template, edition 16 (Robertson & Robertson, 2012). Four parts / 27 sections (verbatim table of contents):
    - **Project Drivers:** 1 The Purpose of the Project; 2 The Stakeholders
    - **Project Constraints:** 3 Mandated Constraints; 4 Naming Conventions and Terminology; 5 Relevant Facts and Assumptions
    - **Functional Requirements:** 6 The Scope of the Work; 7 Business Data Model & Data Dictionary; 8 The Scope of the Product; 9 Functional Requirements
    - **Non-functional Requirements:** 10 Look and Feel; 11 Usability and Humanity; 12 Performance; 13 Operational and Environmental; 14 Maintainability and Support; 15 Security; 16 Cultural; 17 Legal
    - **Project Issues:** 18 Open Issues; 19 Off-the-Shelf Solutions; 20 New Problems; 21 Tasks; 22 Migration to the New Product; 23 Risks; 24 Costs; 25 User Documentation and Training; 26 Waiting Room; 27 Ideas for Solutions
  - **kiro:** requirements.md / design.md / tasks.md split (out of this skill's writing scope beyond requirements.md).
  - **custom:** organization template; must still host the three-layer structure of Step 3.
- **Output:** chosen template + skeleton.
- **Completion criterion:** every Volere section has an owner (author or explicit "N/A with reason").
- **Failure handling:** organization forbids the template → record decision; default remains volere.

### Step 2: Three-Layer Structure Assembly

- **Operation:** Arrange content into the mandatory three layers (per SKILL v2.0 design, grounded in Wiegers & Beatty 2013 Ch.1-2 business/user/system requirement levels):
  - **Business Requirements layer** ← S1 `business_goal_artifact` (problem statement, goals, success criteria)
  - **User Requirements layer** ← S2 `raw_requirement_artifact` (user tasks, scenarios)
  - **System Requirements layer** ← S3 EARS entries + NFRs + constraints
- **Output:** layered document skeleton populated with pointers.
- **Completion criterion:** no layer empty; every system-layer item shows its upward link.
- **Failure handling:** a layer has no content → upstream stage incomplete; STOP and route back.

### Step 3: EARS Entry Placement + Fit Criteria

- **Operation:** Place each EARS entry in its section (functional → Volere §9; NFR categories → Volere §§10-17 by type). Attach to EVERY requirement the two Volere fields:
  - **Rationale** — why the requirement exists (already present as `rationale` from S3).
  - **Fit criterion** — the acceptance measurement. Volere (ed.16, p.6): "You make a requirement testable by adding its fit criterion. This fit criterion [defines how you test whether the delivered product] fits the requirement. If a fit criterion cannot be found for a requirement, then the [requirement is not testable]." And: all requirements "should carry a fit criterion."
- **Output:** entries with rationale + fit criterion populated.
- **Completion criterion:** 100% of entries carry both fields; every fit criterion is measurable (no hedging words per `../validators/ambiguous_words.yaml`).
- **Failure handling:** unmeasurable fit criterion → rewrite using the abstraction/quantification rules in `../methods/implementation-neutrality.md` §6 and `../methods/specification-quality.md` §7.2.

### Step 4: Non-Functional Requirements Completion

- **Operation:** For each Volere NFR section (10-17), verify at least one quantified entry exists or record explicit "not applicable + reason". Draft NFRs in EARS format (typically Ubiquitous or State-driven) with numeric fit criteria (time, ratio, capacity — business-level metrics, not QPS/TPS).
- **Output:** complete NFR sections.
- **Completion criterion:** no NFR statement contains hedging words; every NFR has a numeric fit criterion.
- **Failure handling:** stakeholder cannot quantify → mark as TBD with owner and deadline (Wiegers Ch.11: "Resolve all TBDs... before the developers proceed with construction of that portion").

### Step 5: Constraints and Assumptions Sections

- **Operation:** Populate Volere §3 (Mandated Constraints), §5 (Relevant Facts and Assumptions). Each constraint carries **rationale + fit criterion + authority source** (per Volere ed.16 practice shown in its constraint examples). Mandated technologies (implementation-neutrality §7 exceptions) live ONLY here, never in functional sections.
- **Output:** constraints and assumptions sections.
- **Completion criterion:** every constraint names its authority; every assumption is flagged and has a verification owner.
- **Failure handling:** constraint without authority → reject as ungrounded; return to stakeholder.

### Step 6: Traceability Matrix Generation

- **Operation:** Build the matrix per `../methods/traceability.md` §4: rows = business_goal_id; columns = user_requirement_ids, system_requirement_ids (EARS ids), acceptance_spec_ids (reserved for S5), design_element_ids / code_element_ids (reserved, NOT filled by this skill). Populate only links that exist in the artifacts — never guess.
- **Output:** traceability_matrix.
- **Completion criterion:** every business goal has ≥1 user requirement; every user requirement has ≥1 EARS entry; every EARS entry has ≥1 upward link.
- **Failure handling:** orphan in either direction → Blocking; resolve before Step 7.

### Step 7: Completeness Check

- **Operation:** Automated scan: missing sections (owner unassigned, no N/A), orphan requirements, TBD inventory, coverage_percentage = traced requirements / total requirements. Cross-check against `../methods/traceability.md` §7.2 audit rules 1-3.
- **Output:** completeness_check {missing_sections, orphan_requirements, coverage_percentage}.
- **Completion criterion:** missing_sections empty, orphans empty, coverage = 100%.
- **Failure handling:** any miss → fix at source (the owning step), never paper over in the matrix.

### Step 8: Baseline Version Assignment

- **Operation:** Assign baseline_version (semantic, e.g. v1.0.0) and baseline_date. Record the version manifest: which gate checklist items passed, who reviewed.
- **Output:** baseline_version, baseline_date fields populated.
- **Completion criterion:** version unique in project history.
- **Failure handling:** version collision → increment; never reuse.

## 5. Output Contract

Complete `SpecificationArtifact` (schema: `../validators/schemas/specification_artifact.json`):

| Field | Content |
|:---|:---|
| analysis_model | from S3 (unchanged) |
| srs_document | {format, template, sections} — Volere 27-section skeleton populated |
| traceability_matrix | business_goal → user_requirement → system_requirement (+ reserved downstream columns) |
| completeness_check | {missing_sections, orphan_requirements, coverage_percentage} |
| baseline_version / baseline_date | assigned at Step 8 |

## 6. Gate Checklist (gate-4)

- [ ] G4.1 Traceability coverage = 100% (no orphan requirements in either direction)
- [ ] G4.2 completeness_check.missing_sections is empty (every section owned or explicitly N/A)
- [ ] G4.3 Every NFR carries a quantified fit criterion (no "the system shall be fast")
- [ ] G4.4 Every requirement carries rationale + fit criterion (Volere rule)
- [ ] G4.5 All TBDs have owner + deadline; none block a section needed for construction
- [ ] G4.6 Zero implementation-leak terms outside the Mandated Constraints section
- [ ] G4.7 baseline_version assigned and unique
- [ ] G4.8 **Human checkpoint: stakeholders formally sign off the baseline**

## 7. Common Mistakes

| Mistake | Example | Correction |
|:---|:---|:---|
| Gold plating | EARS entry with no upward trace to any business goal | Delete or obtain authorized goal (traceability §7.2 rule 3) |
| Unmeasurable fit criterion | "response shall be fast" | Quantify: "identity confirmation completes within 2 seconds" |
| Tech leak in functional sections | "system shall store orders in MySQL" | Move mandated tech to Volere §3 constraints; abstract the function |
| Matrix guessing | Filling code_element column with guessed module names | Reserved columns stay empty until downstream phases fill them (traceability §7.3) |
| Skipping N/A discipline | Empty sections with no reason recorded | Every skipped section gets "N/A + reason" |

## 8. Human Checkpoint & Co-Creation Loop

```
Agent Draft (populated SRS skeleton + matrix)
   → Human Review (stakeholders read business layer; engineers read system layer)
   → Agent Refine (corrections; re-run completeness scan)
   → Quality Gate (gate-4)
   → PASS: produce specification Token (PACT) / mark baseline (standalone)
   → FAIL: loop back (max 3 rounds)
```

After 3 failed rounds: escalate with the completeness report; typical root cause is upstream gaps (return to S2/S3), not documentation defects.

**After Gate-4:** hand over to S5 (validation). In PACT terms the `specification` Token now exists in the Counter and becomes available to `validator` (reads via raw_requirement) and `auditor`.
