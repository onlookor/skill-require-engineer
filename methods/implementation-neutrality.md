---
module: implementation-neutrality
grounding: verbatim
source: >
  Primary: Robertson, J., Robertson, S., & Reed, A. (2024). Mastering the Requirements Process,
  4th Edition. Addison-Wesley. Chapter 16: Finding the Essence (pp.462-480).
  Companion: Chapter 18 The Brown Cow Model (see ./brown-cow.md).
  Companion: Martinelli (2025) observable behavior test (see ./specification-quality.md §6).
pdf_ref: "Mastering the Requirements Process, 4th Edition - James Robertson & Suzanne Robertson & Adrian Reed (calibre converted).pdf"
parse_cache: "_parse_cache/robertson.md"
page_refs:
  essence_definition: "Ch.16 pp.462-463"
  problem_vs_solution: "Ch.16 pp.463-464"
  why_find_essence: "Ch.16 p.469"
  presumed_solutions: "Ch.16 p.469"
  ask_why_method: "Ch.16 pp.470-473 (professor example)"
  technological_fossils: "Ch.16 pp.473-474"
  referred_pain: "Ch.16 pp.474-476 (help desk example)"
  disguised_problems: "Ch.16 pp.476-478 (supermarket POS example)"
---

# Implementation Neutrality — Essence, Abstraction, and Leak Prevention

## 1. Purpose

This module operationalizes the hub's Implementation Independence invariant (§4.1 SKILL.md). Requirements must describe the **essence** of the problem — the what — never the implementation — the how. This module defines:

1. What the essence is and why requirements must live there.
2. The repeated-Why method for stripping implementation from stakeholder statements.
3. Four traps that masquerade as essence (presumed solutions, technological fossils, referred pain, disguised problems).
4. A detection-and-repair procedure for implementation leaks in requirement artifacts.

## 2. The Essence

**Source:** Robertson et al. (2024), Ch.16, pp.462-463.

"The essence is an abstraction, it's conceptual, it has no real-world technology, and that is what makes it such a powerful requirements tool. By shaking off any implementation technology, both current or proposed, human or organizational, you are left with only the problem itself... You could say that the essence is the soul of the problem, but not its body."

Canonical example (p.462): searching for David Bowie's birthday is a solution; **the essence is to know his birthday** — which can be achieved by searching, writing to the fan club, or consulting the register of births. "Regardless of how you solve it, the essence is to know his birthday."

**Problem vs solution (pp.463-464):**

> "A problem is an abstract thing. A solution is a physical thing."

"The problem has no physical incarnation; it exists only in the mind. The solution exists in some tangible artifact: It's the computer on your desk or the device in your hand; it's the software running on your device... it's the list of instructions for an employee to follow."

**Why find the essence (p.469):**

1. "The first, and most important, reason is that you solve the right problem."
2. "Finding the essence means you avoid the presumed solution."

**Mandate (p.469):** "Separate the essence of the problem from any proposed solution." — stated as a boxed principle in the book.

## 3. Presumed Solutions

**Source:** Robertson et al. (2024), Ch.16, p.469.

"Unfortunately, people tend to express their needs in technological terms: 'I need a content management system'; 'I need a mobile device app'; 'I need a drop-down menu'. These presumed solutions are often 'flavor of the month, bright shiny object' solutions that might solve the problem but are far more likely to disappoint."

**Connection:** when a stakeholder statement is a presumed solution, classify it as **Future-How** in the Brown Cow model and trigger the reverse-engineering protocol (see `./brown-cow.md` §4.1).

## 4. The Repeated-Why Method

**Source:** Robertson et al. (2024), Ch.16, pp.470-473.

"You can often reverse engineer the essence from a technological implementation by asking why repeatedly until you arrive at a statement that is clear of any technology and is the essence of the problem."

"Asking why is standard practice that is ingrained, or should be, into every discoverer of requirements. It is probably the most effective technique for getting to the essence of the problem."

**Termination rule (verbatim):** "Some people say that you should ask why five times... We prefer to think of it as asking why as many times as you need to until you arrive at an essential answer and are satisfied that you have discovered the right problem."

### 4.1 Worked example (keep as canonical training case)

**Input (presumed solution as user story, p.471):**

> As a university professor / I want to search for a book by title / So that I can check its price and availability

**Why chain (pp.471-472):**
- Why search? "'Search' is a solution to something; it's not the problem... Finding something is the real business problem."
- Why find a book? "He's putting together a reading list for his students."
- Why search **by title**? "He explains that's what he's always done. But that implies that he already knows which book and does not leave any scope for finding new books."
- Why check the price? "Because the university sets a book budget for courses."
- Why check availability? "Because students have to be able to buy it."

**Output (essential story, p.473):**

> As a university professor / I can assemble a reading list for my students / So that the list contains my preferred books, the books are available, and the students can acquire the books within the university's budget for my course

"Compare the essence with the solution given originally. You can imagine how the solution for the essence would bring far more value than the originally-proposed solution."

## 5. The Four Traps

### 5.1 Technological fossils

**Source:** Ch.16, pp.473-474.

"Technological fossils are technological solutions that have been part of a system for many years, and yet the reason for them has long since disappeared." (Example: embossed credit-card numbers, originally for carbon-paper imprint machines.)

"Technological fossils are things that are mistakenly accepted as essence. Part of finding the essence of the problem is to look for these fossils in your customer's organization. You can uncover them by asking why. **If you don't get an answer that relates to essence, you probably have a fossil.**"

### 5.2 Referred pain

**Source:** Ch.16, pp.474-476.

"'Referred pain' is a medical term. It concerns pain that is felt in one part of the body, but the cause of the pain lies elsewhere."

Example (pp.475-476): staff complain about long hold times at the internal help desk. Solutions like hiring more staff, call-back systems, or calming music "address the symptom and leave the cause of the problem untouched... The root cause of the problem has nothing to do with the help desk; it is with people needing the help desk." By investigating why staff need help, you may find systems that are hard to use, or a lack of training.

"Treating symptoms... without understanding and addressing the root cause is only superficially effective at best. Before you can solve the problem, you need to uncover the essence of the problem."

### 5.3 Disguised problems

**Source:** Ch.16, pp.476-478.

Example: supermarket managers want a new point-of-sale system because of long checkout lines. "The IT department seems to be solving the problem that it wants to solve... it is far from clear that a new system would do much to alleviate the real problem."

Alternative causes listed in the book (p.478): not enough registers, not enough clerks, slow clerks, malfunctioning barcode scanners, slow bagging, checkout-area design.

**Lesson:** a stated solution (new POS system) may disguise a problem whose true causes lie elsewhere; enumerate alternative causes before accepting the framing.

## 6. Detection and Repair Procedure (for Agents)

### 6.1 Detection — when to flag `[IMPLEMENTATION LEAK]`

A requirement artifact contains an implementation leak if any statement:

1. Names a technology, product, framework, or platform (matches `../validators/implementation_leak_terms.yaml`);
2. Names UI mechanisms (button, page, screen, form, dropdown, checkbox);
3. Describes internal system mechanics (database transaction, repository call, internal message, UI framework refresh — per Martinelli observable-behavior test, `./specification-quality.md` §6);
4. Fails the ultimate test: **would the statement still be true if the solution were delivered through a completely different technology?** (CLI instead of web app, paper process instead of software, batch instead of real-time)

### 6.2 Repair — abstraction transformation table

Derived from the book's examples (professor story §4.1, Brown Cow abstraction in `./brown-cow.md`). Apply top-down; each row shows the leak and the essential rewrite:

| Leaked expression | Essential rewrite pattern | Source of pattern |
|:---|:---|:---|
| "search for X" | "find X" (search is one means of finding) | Ch.16 p.471 |
| "click/press/tap <UI element>" | "<actor> initiates/submits/requests <business action>" | derived |
| "fill in a form/field" | "<actor> provides <information/credential>" | derived |
| "call the API/interface" | "<external party> requests <business service>" | derived |
| "save to database / write record" | "the business retains <record>" | derived |
| "return HTTP 200 / status code" | "the business confirms/accepts <action>" | derived |
| "return HTTP 4xx/5xx / error" | "the business refuses/cannot complete <action>" | derived |
| "send token / JWT / cookie" | "access rights are granted" | derived |
| "<microservice/module name> does X" | "<business capability> does X" | derived |
| "screen/page displays Y" | "<actor> is informed of Y" | derived |

⚠️ Rows marked "derived" are compilations of the book's abstraction principle (strip the physical, keep the essential purpose), not verbatim quotes. They implement the mandate: "The moral of this story is that for any piece of technology—no matter how beguiling, state of the art, and attractive it is—you must abstract out the technology and see its underlying essential purpose." (Ch.16 p.474)

### 6.3 Verification after repair

Every repaired statement must pass all four:
- [ ] No term from `../validators/implementation_leak_terms.yaml`
- [ ] Observable from outside: a customer could watch it happen (phenomena b, per `./problem-statement.md` §2)
- [ ] Technology-swap test: statement survives replacing the entire solution technology
- [ ] Still traces to the same business goal after rewriting

## 7. Boundary with Legitimate Technical Content

Two cases where technical language is **not** a leak:

1. **Constraints** (per Volere/Wiegers classification): a stakeholder or governing body with authority mandates a specific technology or standard. Record it as a **constraint** with rationale and source authority, never as a functional requirement.
2. **World properties W** (per `./problem-statement.md` §3): facts about the problem world that include existing technology (e.g., "the current payroll system runs COBOL batch jobs nightly"). These describe the world, not the new machine.

Everything else in a requirement artifact must be essence.

## 8. Cross-References

- Hub invariant: SKILL.md §4.1 Implementation Independence
- Quadrant model for classification: `./brown-cow.md`
- Observable-behavior test (companion detector): `./specification-quality.md` §6
- R/S/W grounding for "world vs machine": `./problem-statement.md`
- Detector data: `../validators/implementation_leak_terms.yaml`
- Canonical definitions: `../kb/implementation-neutrality-patterns.yaml`
