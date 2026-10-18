---
module: ears-syntax
grounding: verbatim
source: "Mavin, A., Wilkinson, P., Harwood, A., & Novak, M. (2009). EARS - Easy Approach to Requirements Syntax. IEEE RE 2009. DOI: 10.1109/RE.2009.9"
pdf_ref: "Easy_Approach_to_Requirements_Syntax_(EARS).pdf"
page_refs:
  generic_syntax: "p.3 (Section 4.1)"
  ubiquitous: "p.3 (Section 4.2)"
  event_driven: "p.3 (Section 4.3)"
  unwanted_behaviour: "p.3-4 (Section 4.4)"
  state_driven: "p.4 (Section 4.5)"
  optional_feature: "p.4 (Section 4.6)"
  complex_syntax: "p.4 (Section 4.7)"
  results: "p.4-5 (Section 5)"
---

# EARS - Easy Approach to Requirements Syntax

## 1. Purpose

EARS is a small set of structural rules that allows all natural language requirements to be expressed in one of five simple templates. It was developed at Rolls-Royce PLC to address eight common requirement problems in unconstrained natural language (NL) requirement documents.

**Source:** Mavin et al. (2009), IEEE RE 2009, Section 4.

## 2. Eight Common NL Requirement Problems

The following eight problems are what EARS is designed to mitigate. These are the problems that EARS was explicitly developed to address (Section 2 of the paper):

| # | Problem | Definition (verbatim from paper) |
|---|---------|--------------------------------|
| 1 | **Ambiguity** | A word or phrase has two or more different meanings. (Three forms: lexical, referential, syntactical) |
| 2 | **Vagueness** | Lack of precision, structure and/or detail. |
| 3 | **Complexity** | Compound requirements containing complex sub-clauses and/or several interrelated statements. |
| 4 | **Omission** | Missing requirements, particularly requirements to handle unwanted behaviour. |
| 5 | **Duplication** | Repetition of requirements that are defining the same need. |
| 6 | **Wordiness** | Use of an unnecessary number of words. |
| 7 | **Inappropriate implementation** | Statements of how the system should be built, rather than what it should do. |
| 8 | **Untestability** | Requirements that cannot be proven true or false when the system is implemented. |

**Note:** Conflicting requirements and missing traceability links were consciously excluded from the original study (Section 2).

## 3. Generic Requirements Syntax

**Source:** Section 4.1, p.3.

The generic requirement syntax is:

```
<optional preconditions> <optional trigger> the <system name> shall <system response>
```

**Ordering is significant** — it follows temporal logic:

1. Any preconditions must be satisfied — otherwise the requirement cannot ever be activated.
2. The trigger must be true for the requirement to be "fired", but only if the preconditions were already satisfied.
3. The system is required to achieve the stated system response if and only if the preconditions and trigger are true.

Both preconditions and trigger are optional, depending on the requirement type.

## 4. Five EARS Requirement Types

### 4.1 Ubiquitous Requirements

**Source:** Section 4.2, p.3.

A ubiquitous requirement has **no preconditions or trigger**. It is not invoked by an event detected at the system boundary or in response to a defined system state, but is **always active**.

**General form:**

```
The <system name> shall <system response>
```

**Example (verbatim from paper):**

> "The control system shall prevent engine overspeed."

This is a system behaviour that must be active at all times.

**When to use:** For system behaviours that are always active, with no triggering event and no conditional state.

### 4.2 Event-Driven Requirements

**Source:** Section 4.3, p.3.

An event-driven requirement is initiated **only when a triggering event is detected at the system boundary**.

**General form:**

```
WHEN <optional preconditions> <trigger> the <system name> shall <system response>
```

**Example (verbatim from paper):**

> "When continuous ignition is commanded by the aircraft, the control system shall switch on continuous ignition."

This system response is required when and only when the stated event is detected at the boundary of the system.

**When to use:** For system responses triggered by specific events at the system boundary.

### 4.3 Unwanted Behaviour Requirements

**Source:** Section 4.4, pp.3-4.

Requirements to handle unwanted behaviour are defined using a syntax derived from event-driven requirements.

**"Unwanted behaviour"** is a general term used to cover all situations that are undesirable. This includes:
- Failures
- Disturbances
- Deviations from desired user behaviour
- Any unexpected behaviour of interacting systems

The authors' experiences suggest that unwanted behaviour is a **major source of omissions** in early requirements, necessitating costly rework.

**General form:**

```
IF <optional preconditions> <trigger>, THEN the <system name> shall <system response>
```

**Example (verbatim from paper):**

> "If the computed airspeed fault flag is set, then the control system shall use modelled airspeed."

In this example, the unwanted event (computed air speed fault flag is set) triggers the system response, which allows continued safe operation of the system.

**Key distinction:** Using the If-Then structure explicitly differentiates requirements that handle unwanted behaviour. The system response mitigates the impact of the unwanted event, or prevents the system from entering an unwanted state.

**When to use:** For failure handling, fault tolerance, error recovery, and any scenario involving undesirable conditions.

### 4.4 State-Driven Requirements

**Source:** Section 4.5, p.4.

A state-driven requirement is active **while the system is in a defined state**.

**General form:**

```
WHILE <in a specific state> the <system name> shall <system response>
```

**Example (verbatim from paper):**

> "While the aircraft is in-flight, the control system shall maintain engine fuel flow above XXlbs/sec."

The system response is required at all times whilst the system is in the defined state.

**Alternative keyword:** The keyword **During** can be used instead of **While** for readability:

> "During thrust reverser door translation, the control system shall limit thrust to minimum idle."

In this context, the meaning of During is identical to While.

**When to use:** For system behaviours that are active only while the system is in a specific state.

### 4.5 Optional Feature Requirements

**Source:** Section 4.6, p.4.

An optional feature requirement is applicable **only in systems that include a particular feature**.

**General form:**

```
WHERE <feature is included> the <system name> shall <system response>
```

**Example (verbatim from paper):**

> "Where the control system includes an overspeed protection function, the control system shall test the availability of the overspeed protection function prior to aircraft dispatch."

This functionality only makes sense (and therefore is only required) for a system that includes the specified feature.

**When to use:** For configurable or optional features that are not present in all system deployments.

## 5. Complex Requirement Syntax (Combinations)

**Source:** Section 4.7, p.4.

For requirements with complex conditional clauses, combinations of the keywords **When**, **While**, and **Where** may be required. The keywords can be built into more complex expressions to specify richer system behaviours.

### 5.1 When + While

The same event may trigger different system behaviour depending on the state of the system when the event is detected.

**Example (verbatim from paper):**

> "While the aircraft is on-ground, when reverse thrust is commanded, the control system shall enable deployment of the thrust reverser."

The triggering event (reverse thrust command) triggers the system response only when the system is in a particular state (aircraft on-ground).

### 5.2 While + If-Then

Keywords When, While, and Where can also be used within If-Then statements to handle unwanted behaviour with more complex conditional clauses.

**Example (verbatim from paper):**

> "While the aircraft is in-flight, if reverse thrust is commanded, then the control system shall inhibit thrust reverser deployment."

The trigger (reverse thrust command) is unwanted whilst in-flight and the required system response prevents the system from entering an unwanted state.

### 5.3 If-Then with When precondition

**Example (verbatim from paper):**

> "When selecting idle setting, if aircraft data is unavailable, then the control system shall select Approach Idle."

The unwanted behaviour (aircraft data is unavailable) should result in the stated system response only when the triggering event (selecting idle) is satisfied.

### 5.4 Complex Combination Rules

| Combination | Pattern | When to Use |
|:---|:---|:---|
| While + When | `WHILE <state>, WHEN <trigger>, the <system> shall <response>` | Event triggers different behaviour depending on state |
| While + If-Then | `WHILE <state>, IF <unwanted trigger>, THEN the <system> shall <response>` | Unwanted behaviour with state-dependent handling |
| When + If-Then | `WHEN <trigger>, IF <condition>, THEN the <system> shall <response>` | Unwanted behaviour triggered by event |
| Where + When | `WHERE <feature>, WHEN <trigger>, the <system> shall <response>` | Optional feature with event trigger |
| Where + While | `WHERE <feature>, WHILE <state>, the <system> shall <response>` | Optional feature with state-driven behaviour |
| Where + If-Then | `WHERE <feature>, IF <unwanted trigger>, THEN the <system> shall <response>` | Optional feature with unwanted behaviour handling |

## 6. Raw-to-EARS Rewriting Examples (Table 1)

**Source:** Section 5, Table 1, pp.4-5.

The following examples show raw extracts from CS-E (Certification Specification for Engines) and their EARS interpretations. These are the canonical rewriting examples from the paper.

### Example 1: Ubiquitous

| Raw Extract | EARS Interpretation | Type |
|:---|:---|:---|
| "It must be substantiated by tests, analysis or a combination thereof that the Engine Control System performs the intended functions in a manner which does not create unacceptable thrust or power oscillations." | "The Engine Control System shall not cause unacceptable thrust or power oscillations." | Ubiquitous |

### Example 2: Event-Driven

| Raw Extract | EARS Interpretation | Type |
|:---|:---|:---|
| "It must be demonstrated that, when a Fault or Failure results in a change from one Control Mode to another, or from one channel to another, or from the Primary System to the Back-up System, the change occurs so that the Engine does not exceed any of its operating limitations." | "When the Engine Control System changes operational mode, the Engine Control System shall maintain the engine within approved operational limits." | Event-Driven |

### Example 3: Unwanted Behaviour

| Raw Extract | EARS Interpretation | Type |
|:---|:---|:---|
| "Single Failures leading to loss, interruption or corruption of Aircraft-Supplied Data, must not result in a Hazardous Engine Effect for any Engine." | "If a single Failure leads to deficient Aircraft-Supplied Data, then the Engine Control System shall not cause a Hazardous Engine Effect." | Unwanted Behaviour |

### Example 4: Optional Feature

| Raw Extract | EARS Interpretation | Type |
|:---|:---|:---|
| "When over-speed protection is provided through hydro-mechanical means, it must be demonstrated by test or other acceptable means that the over-speed function remains available between inspection and maintenance periods." | "Where over-speed protection is provided through hydro-mechanical means, the frequency of Engine Control System inspection and maintenance periods shall be consistent with the required availability of the feature." | Optional Feature |

## 7. Patterns Observed During Rewriting

**Source:** Section 5, p.5.

Several patterns emerged as the EARS rules were applied to raw extracts:

1. **Logical restructuring to increase clarity and understanding.**
2. **Reduced wordiness to create simpler statements.**
3. **The separation of complex triggers resulting in two or more atomic requirements.**
4. **Reusable statements and reusable formats.**

## 8. Quantitative Results (Case Study)

**Source:** Section 5, Tables 2 and Graph 1, p.5.

The case study was tested against the eight problem types using 36 raw requirements from CS-E 50 (Certification Specification for Engines):

| Metric | Raw Requirements | EARS Interpretations |
|:---|:---|:---|
| Number of individual requirements | 36.0 | 47.0 |
| Average words per requirement | 36.9 | 25.6 |

**Results by problem type (EARS Applied vs. Raw Text, log scale):**
- **Eliminated:** Complexity, Omission, Duplication, Implementation, Untestability
- **Substantially reduced (not eliminated):** Ambiguity, Vagueness, Wordiness

**Remaining problems attributed to:**
- Lexical ambiguity (precondition understood by inference, not explicitly recorded)
- General vagueness (innate feature of high-level requirements)
- Wordiness (long requirements with numerous conditional clauses)

## 9. Limitations (From the Paper)

**Source:** Section 6, p.5.

1. The sample size was small (36 original requirements).
2. The study was restricted to high-level safety-related requirements. Other types of high-level requirements and lower-level requirements may exist that cannot be adequately represented.
3. Classification of vagueness is inevitably a matter of personal opinion and therefore open to inconsistency.

## 10. EARS Pattern Reference Card

Quick-reference for the five patterns:

| Pattern | Keyword(s) | Template | Always Active? | Has Trigger? | Has State? |
|:---|:---|:---|:---|:---|:---|
| **Ubiquitous** | (none) | `The <system> shall <response>` | Yes | No | No |
| **Event-Driven** | `WHEN` | `WHEN <preconditions> <trigger> the <system> shall <response>` | No | Yes | No |
| **Unwanted Behaviour** | `IF...THEN` | `IF <preconditions> <trigger>, THEN the <system> shall <response>` | No | Yes (unwanted) | No |
| **State-Driven** | `WHILE`/`DURING` | `WHILE <state> the <system> shall <response>` | Yes (while in state) | No | Yes |
| **Optional Feature** | `WHERE` | `WHERE <feature> the <system> shall <response>` | No (if feature present) | No | No |

## 11. EARS Syntax Validation Checklist

Use this checklist when validating EARS requirements:

- [ ] The requirement matches exactly one of the five EARS patterns (or a valid combination per Section 5)
- [ ] The `<system name>` is consistently used across all requirements
- [ ] The `<system response>` describes WHAT the system shall do, not HOW (Implementation Independence)
- [ ] For Event-Driven: the trigger is a detectable event at the system boundary
- [ ] For Unwanted Behaviour: the trigger describes an undesirable condition (failure, disturbance, deviation)
- [ ] For State-Driven: the state is a well-defined system state
- [ ] For Optional Feature: the feature is truly optional and not required in all deployments
- [ ] No requirement mixes keywords incorrectly (e.g., "WHILE WHEN" without IF-THEN is invalid)
- [ ] Preconditions, if present, are stated before the trigger
- [ ] The requirement is testable (can be proven true or false)
