---
module: opportunity-assessment
grounding: verbatim
source: >
  Torres, T. (2021). Continuous Discovery Habits: Discover Products that Create Customer Value and Business Value. Sense & Respond Press.
  Chapters: Ch.1–2 (pp.17–27), Ch.6 Mapping the Opportunity Space (pp.82–88), Ch.7 Prioritizing Opportunities Not Solutions (pp.97–101).
pdf_ref: "Continuous Discovery Habits Discover Products that Create Customer Value and Business Value (Teresa Torres).pdf"
parse_cache: "_parse_cache/torres.md"
page_refs:
  six_mindsets: "Torres Ch.1 pp.18–20"
  continuous_discovery_definition: "Torres Ch.1 p.20"
  outcome_oriented: "Torres Ch.1 p.18"
  opportunity_definition: "Torres Ch.2 p.25"
  ost_structure: "Torres Ch.2 pp.26–27"
  ost_benefits: "Torres Ch.2 p.27"
  tree_relationships: "Torres Ch.6 pp.83–84"
  distinct_branches: "Torres Ch.6 pp.87–88"
  prioritization_criteria: "Torres Ch.7 pp.99–101"
  leaf_node_targeting: "Torres Ch.7 p.98"
  compare_contrast: "Torres Ch.7 pp.98–99"
---

# Opportunity Assessment — From Business Outcomes to Actionable Opportunities

## 1. Purpose

This module defines how to structure and assess customer opportunities as inputs to requirements elicitation. It answers three questions:

1. What is an opportunity, and how does it differ from a solution or a requirement?
2. How does the Opportunity Solution Tree (OST) structure the discovery space?
3. How should opportunities be assessed and prioritized before they become requirements?

> ⚠️ Scope note: This module covers opportunity *assessment* (structuring and prioritizing). It does not cover interview techniques, experience mapping, or assumption testing in detail—those are separate discovery tactics referenced but not fully reproduced here.

## 2. Continuous Discovery — Working Definition

**Source:** Torres (2021), Ch.1, p.20.

"At a minimum, weekly touchpoints with customers by the team building the product where they conduct small research activities in pursuit of a desired outcome."

The goal: "infuse those daily decisions with as much customer input as possible." Research must be "in service of pursuing a desired business outcome while meeting customers' needs." (p.20)

## 3. Six Mindsets for Discovery

**Source:** Torres (2021), Ch.1, pp.18–20.

Six mindsets must be cultivated to adopt continuous discovery habits:

1. **Outcome-oriented** — "Start thinking in outcomes rather than outputs. Rather than defining your success by the code that you ship (your output), you define success as the value that code creates for your customers and for your business (the outcomes)."
2. **Customer-centric** — "Elevate customer needs to be on par with business needs and focus on creating customer value as well as business value."
3. **Collaborative** — "Embrace the cross-functional nature of digital product work and reject the siloed model, where we hand off deliverables through stage gates."
4. **Visual** — "Step beyond the comfort of spoken and written language and tap into our immense power as spatial thinkers."
5. **Experimental** — "Think like scientists identifying assumptions and gathering evidence."
6. **Continuous** — "Evolve from a project mindset to a continuous mindset. Rather than thinking about discovery as something we do at the beginning of a project, infuse discovery continuously throughout your development process."

## 4. Opportunity — Definition

**Source:** Torres (2021), Ch.2, p.25.

"I'll use opportunities to represent customer needs, pain points, and desires collectively and the opportunity space to represent the problem space as well as the desire space."

"To reach their desired outcome, a product trio must discover and explore the opportunity space. The opportunity space, however, is infinite. This is precisely what makes reaching our desired outcome an ill-structured problem."

"How the team defines and structures the opportunity space is exactly how they give structure to the ill-structured problem of reaching their desired outcome."

### 4.1 Relationship to requirements engineering

Opportunities are pre-requirement artifacts. They represent *what customers need* before any solution or requirement statement exists. In the hub's stage model, opportunity assessment feeds Stage 2 (Elicitation): validated opportunities become the raw material from which specific requirements are derived.

## 5. Opportunity Solution Tree (OST) Structure

**Source:** Torres (2021), Ch.2, pp.26–27.

"It starts with defining a clear outcome—one that sets the scope for discovery. From there, we must discover and map out the opportunity space—this is what gives structure to the ill-structured problem of reaching our desired outcome. And finally, we need to discover the solutions that will address those opportunities and thus drive our desired outcome."

"I encourage teams to visualize it using an opportunity solution tree (OST)."

### 5.1 Four layers (verbatim from pp.26–27)

| Layer | Description |
|:---|:---|
| **Root** | "Your desired outcome—the business need that reflects how your team can create business value." |
| **Opportunity space** | "The customer needs, pain points, and desires that, if addressed, will drive your desired outcome." |
| **Solution space** | "Where we'll visually depict the solutions we are exploring." |
| **Assumption tests** | "How we'll evaluate which solutions will help us best create customer value in a way that drives business value." |

### 5.2 OST benefits (verbatim from p.27)

Opportunity solution trees help product trios:

- Resolve the tension between business needs and customer needs
- Build and maintain a shared understanding of how they might reach their desired outcome
- Adopt a continuous mindset
- Unlock better decision-making
- Unlock faster learning cycles
- Build confidence in knowing what to do next
- Unlock simpler stakeholder management

## 6. Tree Relationships — Parent-Child and Sibling

**Source:** Torres (2021), Ch.6, pp.83–84.

"Trees depict two key relationships—parent-child relationships and sibling relationships."

**Parent-child:** "A child opportunity (or sub-opportunity) is a subset of a parent opportunity." Example: "I can't find anything to watch" is the parent of "I'm out of episodes of my favorite shows."

**Sibling:** "Siblings should be similar to each other—in that they are each a subset of the same parent—but distinct in that you can address one without addressing another."

### 6.1 Distinctness principle

**Source:** Torres (2021), Ch.6, pp.87–88.

"We need each opportunity to be distinct from every other opportunity. If there's overlap, then we can't work on one at a time."

Two strategies for uncovering distinct branches:
1. Use the steps of your experience map.
2. Use interview drawings to identify key moments in time.

"The key is to make sure there is no overlap between the moments in time. Overlap will prevent us from working on one opportunity at a time."

## 7. Assessing and Prioritizing Opportunities

**Source:** Torres (2021), Ch.7, pp.97–101.

### 7.1 Focus on one target opportunity at a time

"By addressing only one opportunity at a time, we unlock the ability to deliver value iteratively over time." This is consistent with kanban's limiting work in progress. (p.98)

"You always want to choose a leaf-node opportunity (i.e., one that has no children) because our goal is to deliver iterative value over time." (p.98)

### 7.2 Using the tree to aid decision making

"You'll start by assessing your top-level opportunities—the parent opportunities on your opportunity solution tree." Compare and contrast siblings against each other; avoid "whether or not" questions that lead to confirmation bias. (pp.98–99)

"If your chosen parent is the highest priority, then the highest-impact opportunity to address next will live under that branch. Notice how a single decision reduces the amount of assessing you have to do." (p.99)

Repeat for children of the chosen parent until reaching a leaf node.

### 7.3 Four assessment criteria (verbatim from pp.99–101)

| Criterion | Key Questions |
|:---|:---|
| **Opportunity sizing** | "How many customers are affected and how often?" Distinguish how many from how often. Use behavioral data, support tickets, sample surveys, or interview snapshots for rough estimates. |
| **Market factors** | "How might addressing each opportunity affect our position in the market?" Some are table stakes; others are strategic differentiators. Consider external trends. |
| **Company factors** | "What is the strategic impact for our company, business group, or team?" Prioritize opportunities supporting vision, mission, and strategic objectives. De-prioritize those conflicting with company values. Consider strengths and weaknesses. |
| **Customer factors** | "How important is each opportunity to our customers? How satisfied are they with existing solutions?" Prioritize important opportunities where satisfaction with current solutions is low. |

### 7.4 Embrace messiness

"You might be tempted to score each opportunity based on the different factors and then stack-rank your opportunities. Don't do this. This is a messy, subjective decision, and you want to keep it that way."

"You aren't making absolute judgments. You are making relative judgments by comparing and contrasting sibling opportunities against each other." (p.101)

## 8. Application Protocol

### 8.1 Opportunity assessment workflow

1. **Define the desired outcome** — Express as a measurable business need (root of OST).
2. **Map the opportunity space** — From interviews and experience maps, populate the opportunity layer. Organize by distinct moments in time (§6.1).
3. **Structure as a tree** — Establish parent-child and sibling relationships. Verify distinctness: no overlap between sibling branches.
4. **Assess top-level opportunities** — Compare siblings using the four criteria (§7.3). Make relative, not absolute, judgments.
5. **Drill down** — For the highest-priority branch, repeat assessment at the next level. Continue until reaching a leaf node.
6. **Select target opportunity** — Choose a leaf-node opportunity as the next focus for solution exploration.
7. **Feed to elicitation** — The selected opportunity becomes input to Stage 2 (Elicitation), where it is decomposed into specific requirements and acceptance specifications.

### 8.2 Quality checklist per opportunity

- [ ] Expressed as a customer need, pain point, or desire (not a solution)
- [ ] Distinct from all sibling opportunities (no overlap)
- [ ] Has a clear parent relationship (or is a top-level opportunity linked to the outcome)
- [ ] Assessed against all four criteria when compared with siblings
- [ ] Leaf node selected before solution ideation begins
- [ ] Linked backward to desired outcome and forward to elicited requirements

### 8.3 Severity rules

- **Blocking:** Opportunity expressed as a solution rather than a need; overlap with sibling opportunities preventing independent work; missing link to desired outcome.
- **Non-Blocking:** Incomplete assessment criteria (e.g., missing market factors); opportunity not yet decomposed to leaf level.

## 9. Cross-References

- Elicitation stage: `../stages/s2-elicitation.md` (opportunities feed into requirement elicitation).
- Validation stage: `../stages/s5-validation.md` (assumption tests validate that solutions address opportunities).
- Acceptance specs: `./acceptance-specs.md` (once opportunities become requirements, acceptance specs verify them).
- Specification quality: `./specification-quality.md` (quality attributes apply to requirements derived from opportunities).
- Pattern definitions: `../kb/opportunity-assessment-patterns.yaml`.
