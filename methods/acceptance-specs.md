---
module: acceptance-specs
grounding: verbatim
source: >
  Primary: Adzic, G. (2011). Specification by Example: How Successful Teams Deliver the Right Software. Manning.
  Chapters: Introduction (pp.xiii–xxi), Ch.2 Key Process Patterns (pp.17–53), Ch.8 Refining the Specification (pp.129–130).
  Secondary: Cockburn, A. (2001). Writing Effective Use Cases. Addison-Wesley.
  Chapters: Ch.1 Introduction (pp.4–11), Ch.7 Scenarios and Steps (pp.87–89), Ch.8 Extensions (pp.99–100), Ch.11 Use Case Formats (pp.119–121).
pdf_ref:
  - "Specification by Example How Successful Teams Deliver the Right Software (Gojko Adzic).pdf"
  - "Writing Effective Use Cases (Alistair Cockburn).pdf"
parse_cache:
  - "_parse_cache/adzic.md"
  - "_parse_cache/cockburn.md"
page_refs:
  sbe_definition: "Adzic Intro pp.xiii–xiv"
  process_patterns: "Adzic Intro pp.xix–xxi"
  key_patterns_summary: "Adzic Ch.2 p.53"
  refined_examples_as_acceptance: "Adzic Ch.2 pp.21–22"
  executable_specification: "Adzic Ch.2 pp.22"
  living_documentation: "Adzic Ch.1 pp.30–32"
  given_when_then: "Adzic Ch.8 pp.129–130"
  fully_dressed_template: "Cockburn Ch.11 pp.119–120"
  buy_something_example: "Cockburn Ch.1 pp.9–11"
  main_success_scenario: "Cockburn Ch.7 pp.87–89"
  extensions_basics: "Cockburn Ch.8 pp.99–100"
  success_guarantee: "Cockburn Ch.6 p.84"
---

# Acceptance Specifications — From Requirements to Verifiable Criteria

## 1. Purpose

This module defines how to transform requirements into verifiable acceptance specifications. It answers three questions:

1. What is the relationship between specifications, examples, and acceptance tests?
2. How should acceptance criteria be structured for both human readability and machine executability?
3. How do use case scenarios (Cockburn) and Given-When-Then specifications (Adzic) complement each other as acceptance formats?

> ⚠️ Terminology note: Adzic deliberately chose "Specification by Example" over "acceptance test-driven development" or "BDD" to avoid technical connotations that exclude business stakeholders. This module uses "acceptance specification" as a neutral umbrella term grounded in both sources.

## 2. Specification by Example — Core Definition

**Source:** Adzic (2011), Intro, pp.xiii–xiv.

"Different teams use different names for their ways of dealing with specifications and tests, yet they all share a common set of core principles and ideas, which I hold to be essentially the same thing." The names include Agile Acceptance Testing, Acceptance Test-Driven Development, Example-Driven Development, Story Testing, Behavior-Driven Development, and Specification by Example.

Adzic settled on Specification by Example because it is "the most meaningful name with the least amount of negative baggage" (p.xviii). The name avoids the ambiguity of "agile," the shifting definition of "BDD," and the technical exclusion implied by "test."

**Key axiom:** "With Specification by Example, functional requirements, specifications, and acceptance tests are the same thing." (Ch.2, p.53)

This collapses the traditional separation between requirements documents and test suites into a single artifact.

## 3. The Seven Process Patterns

**Source:** Adzic (2011), Intro, pp.xix–xxi; summary at Ch.2, p.53.

Specification by Example consists of seven named process patterns:

1. **Deriving scope from goals** — "Teams derive the scope from goals once a team is ready for more [work]. They begin with a customer's business goal. Then they collaborate to define the scope that will achieve that goal." (Ch.2, p.19)
2. **Specifying collaboratively** — Everyone should be involved before programming or testing begins, "because we want to use acceptance tests as a target for development." (Intro, p.xix)
3. **Illustrating using examples** — Instead of dumping complex tables, teams produce "key examples to point out that we want only enough to explain the context properly." (Intro, p.xix)
4. **Refining the specification** — "Extract the minimal set of attributes and examples to specify a business rule, add a title and description." The result is "at the same time a specification, a target for development, an objective way to check acceptance, and a functional regression test for later." (Intro, p.xx)
5. **Automating validation without changing specifications** — "An executable specification should be unchanged from what it looked like on the whiteboard; it shouldn't be translated into Selenium commands." (Intro, p.xxi)
6. **Validating frequently** — "Check all the specifications frequently to make sure that the system still does what it's supposed to do and, equally important, to check that the specifications still describe what the system does." (Intro, p.xxi)
7. **Evolving living documentation** — "The long-term payoff from Specification by Example comes from having a reference on what the system does that's as relevant as the code itself but much easier to read." (Intro, p.xxi)

## 4. Refined Examples as Acceptance Criteria

**Source:** Adzic (2011), Ch.2, pp.21–22.

"Key examples must be concise to be useful. By refining the specification, successful teams remove extraneous information and create a concrete and precise context for development and testing. They define the target with the right amount of detail to implement and verify it. They identify what the software is supposed to do, not how it does it."

"Refined examples can be used as acceptance criteria for delivery; development isn't done until the system works correctly for all examples. After providing additional information to make key examples easier to understand, teams create specifications with examples, which is a specification of work, an acceptance test, and a future functional regression test."

### 4.1 Executable specification defined

"An automated Specification with Examples that is comprehensible and accessible to all team members becomes an executable specification. We can use it as a target for development and easily check if the system does what was agreed on, and we can use that same document to get clarification from business users. If we need to change the specification, we have to do so in only one place." (p.22)

## 5. Living Documentation

**Source:** Adzic (2011), Ch.1, pp.30–32.

"Living documentation is a source of information about system functionality that's as reliable as programming language code but much easier to access and understand. Living documentation allows teams to collaboratively analyze the impact of proposed changes and discuss potential solutions."

Four key benefits demonstrated by case studies (p.30):

- **Implementing changes more efficiently** — Living documentation enabled teams to "ascertain the impact of new requirements, specify required changes, and ensure that the rest of the system works as it had before."
- **Higher product quality** — "They defined expectations clearly and made the validation process efficient."
- **Less rework** — "They collaborated better on specifications and ensured a shared understanding of the expectations by all team members."
- **Better alignment** — "Improved collaboration led to a more regular flow of delivery."

## 6. Given-When-Then Language in Specifications

**Source:** Adzic (2011), Ch.8, pp.129–130.

"As a rule of thumb, a specification should declare the context, specify a single action, and then define the expected post-conditions."

"A good way to remember this is Given-When-Then or Arrange-Act-Assert. Given-When-Then is a common format for specifying system behaviors, popularized by the early behavior-driven-development articles. It requires us to write scenarios of system behaviors in three parts:

- Given a precondition
- When an action happens
- Then the following post-conditions should be satisfied"

"Some automation tools, such as Cucumber and SpecFlow, use exactly that language for executable specifications." Even with tools that use tabular or keyword-based formats, "structuring specifications to follow a Given-When-Then flow is an excellent idea."

### 6.1 Single action constraint

"Triggering a single action is crucial. This ensures that a specification is focused on only that action. If a specification lists several actions, a reader will have to analyze and understand how these actions collaborate to produce the final effect in order to understand the results."

### 6.2 Multiple preconditions and postconditions

"A specification can still define several preconditions and postconditions (multiple items in the Given and Then sections) as long as they're all directly related to the function specified by the test."

Canonical example (p.130):

```
Scenario: New user, suspicious transaction
Given a user with no previous transaction history,
And the user's account registration country is the UK,
When the user places an order with delivery country U.S.,
Then the transaction is marked as suspicious,
But the user sees order status as "Pending."
```

### 6.3 Pitfall warning

"A potential pitfall with Given-When-Then language is that it's like prose, which often encourages people to think about flows of interactions rather than expressing business functionality directly."

## 7. Fully Dressed Use Case Format (Cockburn)

**Source:** Cockburn (2001), Ch.11, pp.119–120.

Cockburn's preferred style is "fully dressed":

- One column of text (not a table)
- Numbered steps
- No if statements
- A numbering convention in the extensions section involving combinations of digits and letters (e.g., 2a, 2a1, 2a2)

### 7.1 Template fields (verbatim from Use Case 24, pp.119–120)

| Field | Description |
|:---|:---|
| `<name>` | "the name should be the goal as a short active verb phrase" |
| Context of Use | "a longer statement of the goal, if needed, its normal occurrence conditions" |
| Scope | "design scope, what system is being considered black-box under design" |
| Level | "one of: summary, user-goal, subfunction" |
| Primary Actor | "a role name for the primary actor or description" |
| Stakeholders and Interests | "list of stakeholders and key interests in the use case" |
| Precondition | "what we expect is already the state of the world" |
| Minimal Guarantees | "how the interests are protected under all exits" |
| Success Guarantees | "the state of the world if goal succeeds" |
| Trigger | "what starts the use case, may be time event" |
| Main Success Scenario | "the steps of the scenario from trigger to goal delivery and any cleanup after" |
| Extensions | "extensions, one at a time, each referring to the step of the main scenario" |
| Technology & Data Variations List | "variations that will cause eventual bifurcation in the scenario" |
| Related Information | "whatever your project needs for additional information" |

### 7.2 Main Success Scenario rules

**Source:** Cockburn (2001), Ch.7, pp.87–89.

"We first write a top-to-bottom description of one easy-to-understand and fairly typical scenario in which the primary actor's goal is delivered and all stakeholders' interests are satisfied. This is the main success scenario. All other ways to succeed, and the handling of all failures, are described in the extensions to it."

Each scenario or fragment sits within a structure consisting of:

- **A condition** under which the scenario runs (precondition + trigger for MSS; extension condition for extensions)
- **A goal** to achieve (use case name for MSS; complete or rejoin for extensions)
- **A set of action steps** forming the body
- **An end condition** (goal achieved or abandoned)
- **A possible set of extensions** written as scenario fragments

### 7.3 Extensions basics

**Source:** Cockburn (2001), Ch.8, pp.99–100.

"Below the main success scenario, for every point where the behavior can branch because of a particular condition, write down the condition and then write the steps that handle it. Many extensions end by simply remerging with the main success scenario."

"The extension is really a stripped down use case. It starts with a condition—the one that makes it relevant. It contains a sequence of action steps describing what happens under that condition, and ends with delivery or abandonment of the extension goal."

"These extensions are where the most interesting system requirements reside. The main success scenario often is known to the people on the team. Failure handling often uses business rules that the developers do not know."

Three-phase approach recommended (p.100):
1. Brainstorm and include every possibility.
2. Merge redundant conditions.
3. Write the extension-handling steps.

### 7.4 Success Guarantee

**Source:** Cockburn (2001), Ch.6, p.84.

"The success guarantee states what interests of the stakeholders are satisfied after a successful conclusion of the use case, either at the end of the main success scenario or at the end of a successful alternative path."

"The pass/fail test for the success guarantee section is that the stakeholders agree that if all those assertions are true at the end, they are happy."

## 8. Bridging the Two Formats

Both Adzic and Cockburn converge on the principle that **every requirement must have a verifiable acceptance criterion**, but they express it differently:

| Dimension | Adzic (Specification by Example) | Cockburn (Use Cases) |
|:---|:---|:---|
| Unit of verification | Key example / scenario | Main success scenario + extensions |
| Structure | Given-When-Then | Numbered steps + numbered extensions |
| Completeness test | "Development isn't done until the system works correctly for all examples" | Success guarantee: stakeholders agree assertions are true |
| Failure handling | Separate scenarios per condition | Extension fragments referencing MSS step numbers |
| Audience | "Tests are for humans as well as for machines" | "Storylike format easier to comprehend than long shopping lists" |
| Automation | Automate validation without changing specifications | Not addressed (format-agnostic) |

The two formats are complementary: Cockburn provides the structural template for capturing complete behavioral contracts; Adzic provides the Given-When-Then syntax and the process for making those contracts executable.

## 9. Application Protocol

### 9.1 Transforming a requirement into an acceptance specification

For each requirement or user story:

1. **Identify the goal** — Express as a short active verb phrase (Cockburn template field `<name>`).
2. **Define scope and level** — Is this summary, user-goal, or subfunction? What system boundary applies?
3. **List stakeholders and interests** — Who cares if this succeeds or fails? What are their specific interests?
4. **State preconditions and guarantees** — What must be true before? What minimal guarantees hold under all exits? What success guarantees hold on completion?
5. **Write the main success scenario** — 3–9 numbered steps from trigger to goal delivery. Each step describes observable behavior only.
6. **Brainstorm extensions** — For each step, ask "what can go wrong?" and "what can happen differently?" Write each as a numbered extension fragment.
7. **Refine into Given-When-Then** — For each scenario (MSS and each extension), express as:
   - Given [preconditions from step 5]
   - When [single triggering action]
   - Then [observable postconditions matching success guarantees]
8. **Validate completeness** — Every stakeholder interest from step 3 must be addressed in either the MSS, an extension, or a guarantee. Every business rule must appear in at least one scenario.
9. **Check executability** — Apply the three tests from `./specification-quality.md` §5:
   - Two readers imagine the same outcome?
   - A tester can derive acceptance criteria?
   - An AI tool needs no invented rules?

### 9.2 Quality checklist per acceptance specification

- [ ] Single action per When clause (§6.1)
- [ ] No implementation details (observable behavior only)
- [ ] No hedging words (see `./specification-quality.md` §7.1)
- [ ] Preconditions are explicit, not assumed
- [ ] Postconditions are measurable or observable
- [ ] Extensions cover known failure modes
- [ ] Success guarantees satisfy all stakeholder interests
- [ ] Specification is unchanged from human-readable form when automated (§4.1)

### 9.3 Severity rules

- **Blocking:** Missing success guarantee; untestable postcondition; hidden "and"/"or" in When clause; implementation leak.
- **Non-Blocking:** Missing Technology & Data Variations List; informal precondition wording; missing Related Information.

## 10. Cross-References

- Syntax enforcement: `./ears-syntax.md` (EARS templates complement Given-When-Then for requirement-level statements).
- Quality attributes: `./specification-quality.md` (individual and collection attributes apply to acceptance specs).
- Elicitation stage: `../stages/s2-elicitation.md` (acceptance specs originate from elicited requirements).
- Validation stage: `../stages/s5-validation.md` (acceptance specs are the primary input to validation).
- Pattern definitions: `../kb/acceptance-specs-patterns.yaml`.
