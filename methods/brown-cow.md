---
module: brown-cow
grounding: verbatim
source: "Robertson, J., Robertson, S., & Reed, A. (2024). Mastering the Requirements Process, 4th Edition. Addison-Wesley. Chapter 18: The Brown Cow Model."
pdf_ref: "Mastering the Requirements Process, 4th Edition - James Robertson & Suzanne Robertson & Adrian Reed (calibre converted).pdf"
parse_cache: "_parse_cache/robertson.md"
page_refs:
  model_overview: "pp.506-507 (Section: How Now, Brown Cow?)"
  how_now: "pp.508-509"
  what_now: "pp.510-511"
  future_what: "pp.512-513"
  future_how: "pp.514"
  how_to_use: "pp.515-518"
  review: "pp.519-520"
  trawling_mapping: "Ch.24 Figure 24.5 (Suggested trawling techniques for each Brown Cow viewpoint) — see parse_cache line ~36769"
---

# Brown Cow Model — Four-Viewpoint Abstraction

## 1. Purpose

The Brown Cow model is a way of organizing your thinking while trawling the problem space. It compartmentalizes the aspects of the business problem and its solution so that everybody concerned is clear on exactly what is being discussed and what each aspect contributes to understanding the problem and the solution.

**Source:** Robertson et al. (2024), Ch.18, p.506.

The model keeps two viewpoints separate but linked:
- **How** something is done (implementation)
- The **essence** of what is done (abstraction that removes any physical implementation devices to reveal the underlying policy of the business problem)

## 2. The Two Axes and Four Viewpoints

**Source:** Ch.18, p.507, Figure 18.1.

- **Horizontal axis** divides **What** from **How**.
- **Vertical axis** divides the current situation (**Now**) from the proposed solution (**Future**).

Each quadrant focuses on a single viewpoint. This is particularly useful during team discussions when different people are talking about different aspects of the problem. Use the model to refocus:

> "Are we talking about what's happening with the customer's problem at the moment, or what she wants to have in the future?"
> "Is this supposed to be a technological view of the solution, or an essential view?"

| | **Now** (current situation) | **Future** (proposed solution) |
|:---|:---|:---|
| **What** (essence) | **What-Now**: essence of the current problem space | **Future-What**: essence to be implemented ⭐ most important |
| **How** (implementation) | **How-Now**: current implementation | **Future-How**: technological view of the planned solution |

**Warning on "As-is / To-be" thinking:** Taking only those two views is inadvisable because they ignore the important difference between the physical and the essential thinking. "As-is" and "To-be" encourage rushing from one solution to another and discourage creative thinking. They ignore what "could be."

**Source:** Ch.18, pp.507-508.

## 3. Viewpoint Definitions

### 3.1 How-Now (bottom-left)

**Source:** Ch.18, pp.508-509.

Shows **how things are happening at the moment** — the current implementation of your customer's business: the physical devices used to process the business activities — computers and software (treated as a physical thing), the people, possibly their departments, transportation devices, machines, and so on.

**Aim:** to establish a baseline, to ensure that you are studying the correct part of your customer's business, and to have the stakeholders recognize their work.

**Rule (verbatim emphasis):**

> Do not spend more time than necessary on modeling the How-Now quadrant. Your aim is to get enough of an understanding of the current situation to be able to move on. This is, after all, a view of something you are planning to change.

### 3.2 What-Now (top-left)

**Source:** Ch.18, pp.510-511.

**What the business is doing, and not how it is doing it** — the essence of the current problem space. If you took the How-Now view and abstracted it by stripping away all its technological devices, you'd arrive at its essence: the things that have to be done no matter how they are done or who does them. This view enables you and your customer to see the real business being conducted at the moment, without the distraction of its technology.

**Why it matters:**
- A lot of the current essence must be included in any future solution (many projects are renewal projects).
- For renewal projects, consider **minimal models of How-Now**, only enough to help you discover its essence (the What-Now).
- Gives you the **underlying business policy and business rules** of the current solution.
- Vital for selecting **ready-made solutions** (off-the-shelf [OTS], software as a service [SaaS], open source): any future ready-made solution must be capable of processing most or all of the current essence. The starting point for selecting a ready-made solution should always be the current essence.

### 3.3 Future-What (top-right) ⭐ THE MOST IMPORTANT QUADRANT

**Source:** Ch.18, pp.512-513.

Moving away from the What-Now view and adding your customer's changes gives you the Future-What.

> **The Future-What is the most important quadrant of the model.**

The Future-What is **the essence to be implemented**. Without seeing the essence of the new business, you risk any future solution not solving the right business problem.

**Usage rules:**
- You might choose to start with this one and revert to the Now views if you need to. If you have a good handle on the idea of essence, start here.
- **Greenfield projects** (starting completely from scratch, no legacy): Future-What is the place to start your planning. There is little point in thinking about solutions (How) before you know the essential business to be carried out.
- If a **ready-made solution has been mandated**, it should not be thought of as technology, but treated as **essence**: any ready-mades you plan to use show up in this essential, Future-What view.

**Above-the-line thinking:** The two What/essential views involve "above-the-line thinking" (the horizontal line dividing How from What). In the abstract, essential world, you are unconstrained by technology and are free to imagine what could be:

> Here is where you challenge the existing policies, the work practices, the "but we've always done it this way" mindset. Here is where you use creativity and innovation to explore new and different ways to achieve the organization's goals.

> Spending time on the Future-What viewpoint is never time wasted.

### 3.4 Future-How (bottom-right)

**Source:** Ch.18, pp.514-515.

Shows the technology and people (and any other devices) you plan to use to bring the essence into the physical world. You are moving from the abstract to the tangible — how the business will work in the future.

**Boundary with downstream work:** This quadrant usually overlaps with the work of the solutions architect, and sometimes the enterprise architect. You are treading in their domain when you start to allocate the essence to the available processors.

> Future-How is the technological view of the solution you plan to build. It shows the software or hardware components, the people, and any other device you plan to use. **This is the view that is the basis for your detailed requirements.** And because you based your future implementation on the essence of the problem, you can be confident that your requirements are the right ones.

**NOTE FOR THIS SKILL:** The requirements engineering sub-fragment produces artifacts that live **above the line** (Future-What). Future-How belongs to the Architecture phase downstream in the PACT lifecycle instance. Requirements artifacts must not contain Future-How content (see `implementation-neutrality.md`).

## 4. How to Use the Brown Cow Model

**Source:** Ch.18, pp.515-518.

1. **A thinking framework, not a procedure.** The intention is not to slavishly build a model for each quadrant. Jump in and out of the quadrants wherever you need that viewpoint.
2. **Keep the skeleton visible.** Some teams keep the skeleton of this model in a visible location so that team members can refer to the viewpoint they are discussing. When you build models (process models, prototypes, scenarios), it can be useful to **tag them with the view they portray**.
3. **Models are optional.** A list of business events and their outcomes is often enough to serve as an essential model for the whole of the problem space. The details of the processing of each business use case can be done later. Brown Cow is a tool to allow you to compartmentalize your thinking.
4. **Prototypes usually take the Future-How view** — they are solutions, after all. You should derive the essence from your prototypes to ensure that you are solving the right problem. Prototypes are meant to be disposable.

### 4.1 The Bad News: Presumed Solutions

**Source:** Ch.18, pp.516-518, Figure 18.3.

> Some projects start with the Future-How and never leave it. When you start in this quadrant you're starting with a presumed solution. There is no reference to the actual business rules and policy that the solution must incorporate. There is every possibility that this presumed solution is solving the wrong problem.

**Prescribed remedy — reverse engineering:**

> We strongly suggest in these situations to take the proposed solution and extract its essence. In other words, you reverse engineer it into the Future-What.

Steps (verbatim basis):
1. Take the presumed solution and **extract its essence** (reverse engineer into Future-What).
2. Capture the essence with **a list of business events and their outcomes**.
3. Examine the outcomes and ask if they contribute to the goals established in the Project Blastoff.
4. Optionally build a **context diagram** of the proposed solution and compare it with the one built during the blastoff.
5. Have an informed conversation with stakeholders and resolve the discrepancies.

## 5. Review Points (from the book)

**Source:** Ch.18, pp.519-520.

- The Brown Cow model is a **framework for thinking**. Each quadrant represents a different viewpoint of the same problem space or solution space; you can clearly differentiate between the views you're taking at any given time.
- The viewpoints are **not intended to be taken in a sequence** where it is not practical or effective to do so. Working methodically through all four (How-Now → Future-How) is for untangling complicated situations.
- It is not necessary to build models for each quadrant. The intention is to aid your thinking; whether you commit your thinking to a diagram is up to you.
- Being able to **separate the essential (the What) from the implementation (the How)** gives you a much better chance of seeing the real problem. This means spending a lot of your time thinking **"above the line."**

## 6. Application Rules for This Skill

| Situation | Action |
|:---|:---|
| Stakeholder describes the current way of working | Classify as **How-Now**; keep minimal; abstract to What-Now |
| Stakeholder states a business rule/policy | Classify as **What-Now** (if current) or **Future-What** (if desired change) |
| Stakeholder demands a specific technology/solution | Classify as **Future-How (presumed solution)**; trigger reverse-engineering (§4.1) |
| Writing any requirement artifact | Content must live in **Future-What** (essential, above the line) |
| Tagging models | Every model/scenario/prototype must be tagged with its Brown Cow viewpoint |

## 7. Related Material

- `kb/brown-cow-patterns.yaml` — structured KB for this module
- `implementation-neutrality.md` — enforcement rules derived from the What/How split
- Ch.24, Figure 24.5 — suggested trawling techniques mapped to each Brown Cow viewpoint (grounding for stage s2)
