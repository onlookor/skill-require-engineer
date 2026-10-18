# Requirements Engineering Skill — Complete Directory Structure

## Root Directory

```
requirements-engineering/
├── SKILL.md                          # HUB — Master orchestrator (always loaded)
├── README.md                         # This file
├── build_tree.py                     # One-click script to recreate the entire tree
├── stages/                           # Stage modules (one loaded at a time)
│   ├── s1-business-analysis.md       # S1: Business Analysis (Seed content production)
│   ├── s2-elicitation.md             # S2: Requirements Elicitation
│   ├── s3-analysis.md                # S3: Requirements Analysis
│   ├── s4-specification.md           # S4: Requirements Specification
│   ├── s5-validation.md              # S5: Requirements Validation (Production + Review Mode)
│   └── s6-management.md              # S6: Requirements Management (Cross-cutting)
├── methods/                          # Method modules (cross-cutting, loaded on demand)
│   ├── ears-syntax.md                # EARS five-pattern syntax (L1 verbatim from EARS.pdf)
│   ├── specification-quality.md      # Quality attributes + review gate + executability (Martinelli + Wiegers)
│   ├── brown-cow.md                  # Brown Cow four-viewpoint abstraction (from Robertson 4th Ch.18)
│   ├── problem-statement.md          # Problem frames: R/S/W, entailment, five frames (from Jackson)
│   ├── traceability.md               # Trace links, matrices, audit rules (from Wiegers Ch.29)
│   ├── impact-analysis.md            # Change control process + impact analysis (from Wiegers Ch.28-29)
│   ├── conflict-resolution.md        # Conflict types + dispute resolution (from Wiegers + Volere fragments)
│   ├── implementation-neutrality.md  # Essence, repeated-Why, leak repair (from Robertson 4th Ch.16)
│   ├── opportunity-assessment.md     # Opportunity Solution Tree (from Torres)
│   └── acceptance-specs.md           # SbE + use cases -> Given-When-Then (from Adzic / Cockburn)
├── kb/                              # Grounded Knowledge Base (YAML, zero external deps)
│   ├── ears-patterns.yaml            # L1 verbatim from EARS paper (Mavin et al. 2009)
│   ├── specification-quality-patterns.yaml # Canonical terms + verdict vocabulary (Martinelli + Wiegers)
│   ├── brown-cow-patterns.yaml       # Brown Cow four viewpoints (Robertson 4th Ch.18)
│   ├── problem-statement-patterns.yaml # Problem frames, R/S/W, entailment (Jackson)
│   ├── traceability-patterns.yaml    # Four link types + audit rules (Wiegers Ch.29)
│   ├── impact-analysis-patterns.yaml # Change control + impact analysis (Wiegers Ch.28-29)
│   ├── conflict-resolution-patterns.yaml # Conflict types + resolution hierarchy
│   ├── implementation-neutrality-patterns.yaml # Essence definitions + rewrite rules + traps
│   ├── opportunity-assessment-patterns.yaml    # Opportunity Solution Tree (Torres)
│   ├── acceptance-specs-patterns.yaml          # SbE patterns + GWT rules (Adzic + Cockburn)
│   └── spec7-patterns.yaml           # DEPRECATED stub (redirects to specification-quality)
├── validators/                      # Deterministic validators (zero LLM dependency)
│   ├── ears_regex.yaml               # EARS five-pattern regex + blacklists
│   ├── schemas/                     # JSON Schema files for artifact validation
│   │   ├── business_goal_artifact.json
│   │   ├── raw_requirement_artifact.json
│   │   ├── specification_artifact.json
│   │   ├── validation_report_artifact.json
│   │   ├── re_baseline_artifact.json
│   │   └── review_report.json
│   ├── ambiguous_words.yaml          # Ambiguity/vagueness word blacklist
│   └── implementation_leak_terms.yaml # Technical implementation word blacklist
└── pact/                            # PACT fragment declaration (pact_embedded mode only)
    └── re_fragment.pact              # RE sub-fragment PACT declaration
```

## File Status Matrix

| File | Status | Grounding | Notes |
|------|--------|-----------|-------|
| SKILL.md | ✅ Done (v3.1.0) | N/A | Hub orchestrator |
| stages/s1-business-analysis.md | ✅ Done | Mixed | Seed content production |
| stages/s2-elicitation.md | ✅ Done | Mixed | Elicitation techniques |
| stages/s3-analysis.md | ✅ Done | Mixed | Models + EARS conversion |
| stages/s4-specification.md | ✅ Done (L1) | Volere ed.16 ToC verbatim | Three-layer structure + fit criteria |
| stages/s5-validation.md | ✅ Done | Mixed | Production + Review Mode |
| stages/s6-management.md | ✅ Done (L1) | Wiegers Ch.28 policy verbatim | Change = consume + new production |
| methods/ears-syntax.md | ✅ Done (L1) | Verbatim from EARS.pdf | Mavin et al. 2009 |
| methods/specification-quality.md | ✅ Done (L1) | Martinelli Ch.3/4/6 + Wiegers Ch.11 | Replaces fabricated "SPEC-7" |
| methods/brown-cow.md | ✅ Done (L1) | Verbatim from Robertson 4th Ch.18 | pp.506-520 |
| methods/problem-statement.md | ✅ Done (L1) | Jackson 2005 papers + Chinese scan of Jackson 2001 §4.1.2-4.1.3 | All five frames now L1 |
| methods/traceability.md | ✅ Done (L1) | Wiegers Ch.29 | Four link types + nine-step procedure |
| methods/impact-analysis.md | ✅ Done (L1) | Wiegers Ch.28-29 | Change control + CCB + impact procedure |
| methods/conflict-resolution.md | ✅ Done (L1) | Wiegers + Volere Template V16 verbatim | Upgraded 2026-09-01/02; no L2 left |
| methods/implementation-neutrality.md | ✅ Done (L1) | Robertson 4th Ch.16 | Essence + repeated-Why + four traps |
| methods/opportunity-assessment.md | ✅ Done (L1) | Torres | Opportunity Solution Tree |
| methods/acceptance-specs.md | ✅ Done (L1) | Adzic + Cockburn | SbE patterns + fully-dressed template |
| kb/ears-patterns.yaml | ✅ Done (L1) | Verbatim from EARS.pdf | — |
| kb/specification-quality-patterns.yaml | ✅ Done (L1) | Martinelli + Wiegers | spec7-patterns.yaml deprecated |
| kb/brown-cow-patterns.yaml | ✅ Done (L1) | Verbatim from Robertson 4th Ch.18 | — |
| kb/problem-statement-patterns.yaml | ✅ Done (L1) | Jackson 2005 papers + Jackson 2001 Chinese scan | Upgraded 2026-09-01 |
| kb/traceability-patterns.yaml | ✅ Done (L1) | Wiegers Ch.29 | — |
| kb/impact-analysis-patterns.yaml | ✅ Done (L1) | Wiegers Ch.28-29 | — |
| kb/conflict-resolution-patterns.yaml | ✅ Done (L1) | Wiegers + Volere Template V16 | Upgraded 2026-09-01/02 |
| kb/implementation-neutrality-patterns.yaml | ✅ Done (L1) | Robertson 4th Ch.16 | — |
| kb/opportunity-assessment-patterns.yaml | ✅ Done (L1) | Torres | — |
| kb/acceptance-specs-patterns.yaml | ✅ Done (L1) | Adzic + Cockburn | — |
| validators/ears_regex.yaml | ✅ Done (L1) | Derived from EARS.pdf | Regex; blacklists split out below |
| validators/ambiguous_words.yaml | ✅ Done | EARS + Martinelli p.68 | Categorized + replacement hints |
| validators/implementation_leak_terms.yaml | ✅ Done | EARS + Martinelli pp.66-67 | Categorized + rewrite hints |
| validators/schemas/*.json | ✅ Done | Derived from stage contracts | 6 JSON Schemas (draft-07) |
| pact/re_fragment.pact | ✅ Done | Grounded in pactv1_rev2.md §3.1 | RE sub-fragment declaration; `pact analyze` clean |

## Resumption Guide

See **PROGRESS.md** in this directory for the full resumption guide (parse cache,
pipeline commands, grounding levels, remaining review items). Last saved: 2026-09-01.

## Completion Note (2026-09-02)

All content files are compiled with **no outstanding L2/needs_review items**:
- 2026-09-01: `problem-statement.md` §5.2 upgraded to L1 via image-read of the Jackson 2001 Chinese-translation scan, §4.1.2-4.1.3 (Commanded Behaviour, Transformation, frame-distinction criteria).
- 2026-09-01/02: `conflict-resolution.md` upgraded to L1 via the Volere Requirements Specification Template Edition 16 (§2 stakeholder conflict agreement, §2f user priority precedence, §3d OTS conflicts, §20a environmental conflicts, requirement-template `Conflicts:` field).

Optional next steps:
1. Run a real small requirement through S1→S5 to exercise gates and validators.
2. `build_tree.py` is a read-only verifier of the current tree (the old placeholder-rebuilding script was replaced on 2026-09-01).
