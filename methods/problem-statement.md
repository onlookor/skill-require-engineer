---
module: problem-statement
grounding: mixed (L1 verbatim: Jackson 2005 papers; Jackson 2001 Chinese-translation scanned book §4.1.2-4.1.3 read as images)
source: >
  Primary: Jackson, M. (2005). Problem frames and software engineering.
  Information and Software Technology, 47, 903-912. DOI: 10.1016/j.infsof.2005.08.004
  Secondary: Hall, J.G., Rapanotti, L., & Jackson, M. (2005). Problem frame semantics for software development.
  Software and Systems Modeling, 4, 189-198. DOI: 10.1007/s10270-004-0062-1
pdf_ref:
  - "Problem frames and software engineering (Michael Jackson).pdf"
  - "Problem frame semantics for software development.pdf"
  - "软件开发问题框架 _ 现实世界问题的结构化分析 = Problem frames ; analyzing and structuring software development problems - (英)Michael Jackson著;金芝等译 - 2005 - 北京_机械工业出版社.pdf (image-only scan, read via page images)"
parse_cache:
  - "_parse_cache/jackson1.md"
  - "_parse_cache/jackson2.md"
page_refs:
  machine_problem_world_requirement: "jackson1.md pp.904-905 (§2 The machine and the problem world)"
  r_s_w_descriptions: "jackson1.md p.905 (§3 Problem reduction)"
  entailment: "jackson1.md p.905 (S; W ⊢ R)"
  domain_characterisation: "jackson1.md p.907 (§6 Elementary problem frames)"
  problem_pattern_stipulations: "jackson1.md p.907"
  workpieces_frame: "jackson1.md p.907 (verbatim definition)"
  required_behaviour_frame: "jackson1.md p.907 (verbatim definition)"
  information_display_frame: "jackson1.md p.907 (verbatim definition)"
  transformation_frame: "jackson1.md p.908 (mentioned only); full definition upgraded to L1 via Chinese scan §4.1.2"
  commanded_behaviour_frame: "jackson2.md p.197 Fig.8 (mentioned only); full definition upgraded to L1 via Chinese scan §4.1.2"
  commanded_behaviour_frame_zh: "Chinese scan printed p.62 (PDF page 79), §4.1.2 verbatim"
  transformation_frame_zh: "Chinese scan printed p.62 (PDF page 79), §4.1.2 verbatim"
  frame_distinctions: "Chinese scan printed pp.62-63 (PDF pages 79-80), §4.1.3 verbatim"
  information_display_decomposition: "jackson1.md p.908 (§7, Model domain)"
  composite_problems: "jackson1.md p.908 (§8)"
---

# Problem Frames — Problem Analysis and Problem Statement

## 1. Purpose

Problem frames (PF) provide the analytical foundation for Stage 1 (Business Analysis): before any requirement is elicited or written, the problem itself must be correctly identified, bounded, and classified.

"The problem frames approach is not a development method. It is, rather, a perspective and a conceptual framework, embodying a certain way of looking at an important group of problem classes and of structuring the intellectual processes of developing good solutions." (Jackson 2005, p.904)

It is used here to answer three questions at S1:
1. **What is the problem world** the customer wants transformed?
2. **What is the requirement** (the desired state of that world)?
3. **What class of problem is this**, so the right solution structure can be anticipated?

## 2. The Three Principal Parts

**Source:** Jackson (2005), §2, pp.904-905.

"The development task is to design and construct an artifice. In PF we call this artifice **the machine**, constructed by building software that is then executed on a general-purpose computer... That purpose is to meet a recognised need, which we call **the requirement**. Satisfying the requirement involves transforming the physical world around us: in PF, the part of the world to be transformed, in which the requirement is located, is called **the problem world**."

> "Using Polya's term, we may say that the principal parts of a software development problem are **the machine, the problem world, and the requirement**."

The machine interacts with the problem world at **an interface of shared phenomena a**. The requirement refers to **physical phenomena b of the problem world** — "these are the phenomena that the customer for the system would observe to determine whether the requirement is satisfied."

Key distinctions:
- **Requirement phenomena b** ≠ **specification phenomena a** — they "are distinct—and sometimes disjoint."
- The requirement "is not a tangible part of the problem: it is a predicate or condition on the problem world that the machine is required to bring about."

**Grounding rule:** "abstractions must be firmly grounded in observable physical reality... any abstraction can be unambiguously explained in terms of phenomena that we can observe in the physical world." (p.905)

## 3. Three Descriptions: R, S, W

**Source:** Jackson (2005), §3, p.905.

PF demands a clear distinction among three descriptions:

| Description | Content | Expressed in terms of |
|:---|:---|:---|
| **R** (requirement) | "the customer's requirement—how the world is desired to be" | requirement phenomena b |
| **S** (specification) | "the machine behaviour that must result from execution of the software to be developed" | specification phenomena a |
| **W** (world properties) | "the given properties of the problem world that hold independently of the machine's behaviour and that govern the possible relationships between the specification and requirement phenomena" | problem world |

### 3.1 The Entailment

"To show that the machine will indeed satisfy the requirement it is then necessary to show that: **S; W ⊢ R**"

"In other words, if a machine satisfying S is installed in a problem world satisfying W, then the requirement R will be satisfied... The gap between what is desired at the interface b and what can be directly monitored and controlled by the machine at interface a is bridged by the given properties of the problem world."

**Application:** every requirement must be checkable against the entailment. If R cannot be reached from S using W, then either S is incomplete, W is wrong, or R is infeasible. This is the root of the Feasible and Verifiable attributes (see `specification-quality.md`).

### 3.2 Problem Reduction

"We can imagine a development process that begins by capturing the customer's requirement R, and proceeds, using the given properties W, to devise a machine behaviour specification S. We may call such a process **full problem reduction**."

⚠️ **Warning (verbatim):** "What may have begun as an effort to describe the world slips quickly into a focus on an object or database structure that is intended to represent it in the machine. The PF emphasis on the explicit investigation, description and use of the given problem world properties can be seen as an attempt to exert a countervailing intellectual influence."

**Application:** this is the theoretical basis of the Implementation Independence invariant. Describing the world ≠ designing the machine's internal representation.

## 4. Domain Characterisation

**Source:** Jackson (2005), §6, p.907 (problem pattern stipulations).

Each problem domain in the problem world is characterised by its physical properties:

| Property | Meaning | Example from paper |
|:---|:---|:---|
| **causal** | domain obeys physical cause-effect laws | the Controlled Domain |
| **lexical** | domain is a repository of data/text that can be edited | the WorkPiece |
| **biddable** | domain is a human or agent whose behaviour can be requested but not forced | the User |

Interfaces are characterised by "the types of the subsets of the phenomena—events, states, symbols—that are shared at the interface and to the assignment of control of each subset to one of the sharing domains."

## 5. Elementary Problem Frames

**Source:** Jackson (2005), §6, pp.906-907.

"Elementary problem frames can be regarded as defining problem classes in software engineering that are currently the object of normal design... capture classes of software development problems whose software solutions take the form of individual programs or, at most, very small systems of programs."

"Problem frames do not aim to capture classes of problems of realistic size and complexity. Most of them capture simple subproblems that can appear only as ingredients or aspects of realistic problems."

### 5.1 Frames defined verbatim in the source (L1)

**WorkPieces** (p.907): "In a WorkPieces problem a User edits a WorkPiece such as a text or graphic document. The requirement is that the edit commands issued by the User should effect appropriate corresponding changes in the WorkPiece."
Domains: User (biddable) — Tool Machine — WorkPiece (lexical).

**Required Behaviour** (p.907): "In a Required Behaviour problem the Control Machine is required to impose a particular behaviour on a Controlled Domain."
Domains: Control Machine — Controlled Domain (causal). The requirement constrains the domain's behaviour.

**Information Display** (p.907): "In an Information Display problem the Information Machine is required to monitor the state and behaviour of a Real World and to display information about it on a Display."
Domains: Real World (causal) — Information Machine — Display.
Requirement: "the visible phenomena of the Display should correspond in a certain way to the state of the Real World." (p.908)

### 5.2 Frames defined verbatim in Jackson (2001), Chinese-translation scan (L1)

The following two frames are only mentioned in the provided papers (Transformation: jackson1.md p.908; Commanded Behaviour: jackson2.md p.197 Fig.8). Their full definitions were read verbatim from the Chinese-translation scanned edition of Jackson (2001) — *Problem Frames: Analysing & Structuring Software Development Problems*, trans. Jin Zhi et al., China Machine Press 2005 — §4.1.2, printed p.62 (PDF page 79). The scan is image-only (no text layer); text below was read from page images. Quoted as translated; **upgraded from L2 to L1 on 2026-09-01 after user supplied the scan.**

**Commanded Behaviour (指令行为问题):** "The machine in a commanded behaviour problem must ensure that actions commanded by the operator are properly executed. 命令是作为事件出现的，而命令与受控子领域中被命令的动作之间的联系是指令行为问题所独有的。" Domains: Operator (biddable, 操作员发出命令) — Control Machine — Controlled Domain (causal). "售货机是一个好的例子：投入一枚硬币命令售货机分发一份糖果；如果命令被接受，售货机必须保证这个命令被执行。" (printed p.62)

**Transformation (转换问题):** "在转换问题中，需求描述输入文件与输出文件之间的关系。计算机必须读入输入文件，产生输出文件。" Domains: Input File (lexical) — Computer — Output File (lexical). "例如，工资单处理、编译等问题属于转换问题。" (printed p.62) (Corroborated verbatim in English in jackson1.md p.908: "problems fitting the Transformation frame, in which the task is to produce sequential output streams from sequential input streams.")

### 5.3 How the elementary frames differ (§4.1.3, printed pp.62-63, L1)

Four distinguishing dimensions, read verbatim from the scan:
1. **需求形式不同：** "所需行为问题的需求是：受控子领域的行为必须满足给定的条件。在指令行为问题中，需求是操作员发出命令，机器保证被命令的动作被执行。在信息显示问题中，需求是显示的内容与现实世界子领域状态之间的对应关系必须得到保证。在简单工作件问题中，需求是用户对工作件的编辑命令必须产生相应的变化。在转换问题中，需求是输入与输出文件之间的给定关系必须成立。"
2. **问题领域特征不同：** causal / biddable / lexical 特征的组合随框架而变（对应 §4 的领域特征化表）。
3. **领域涉及面不同：** 每个框架固定了哪些现象在哪些领域的接口上共享、控制权归谁。
4. **框架关注点不同：** "框架的需求、领域特征以及领域的涉及面之间的不同，导致框架关注点的不同。" (printed p.63)

### 5.4 Frame selection guide (for S1 classification)

| If the customer's need is about... | Likely frame | Decisive question |
|:---|:---|:---|
| keeping a physical process within required bounds | Required Behaviour | What causal domain must behave differently? |
| humans commanding a device that acts on the world | Commanded Behaviour | Who commands, and what guarantees the command is honoured? |
| creating/editing documents or data artifacts | WorkPieces | What lexical artifact is edited, by whose commands? |
| showing people the state of the world | Information Display | What real-world state must be displayed, and how fresh/accurate? |
| producing output records from input records | Transformation | What relation must hold between input and output streams? |

Realistic problems are **composites** (§7): decompose the problem world into domains, classify each subproblem against a frame, and note the interfaces between them.

## 6. Problem Decomposition and Composition

**Source:** Jackson (2005), §7-8, p.908.

Standard decomposition pattern for Information Display with information deficit: split into two subproblems communicating via an invented **Model** domain (lexical, e.g., a database):
- Subproblem 1 maintains Model ↔ Real World correspondence.
- Subproblem 2 maintains Display ↔ Model correspondence.

Composition rule: "If we can express the requirements Display ≈ Model and Model ≈ Real World as relations, it seems clearly desirable that their relational composition should be equal to the original requirement Display ≈ Real World."

⚠️ "Introducing the Model domain is an unavoidable, and necessarily universal, practice in software development." — the Model is part of the **machine's** construction, not of the problem world. Requirements artifacts must stay with phenomena b (the customer-observable world); the Model belongs to S, not to R.

Composite problems: "A problem fitting an elementary frame will sometimes be soluble by a simple machine, whose specification can be a single text. But sometimes a specific concern will demand..." decomposition into subproblems each fitting a frame (§8).

## 7. Application in This Skill

### 7.1 In Stage 1 (Business Analysis)

Before elicitation begins, produce a **problem frame analysis**:

```yaml
problem_frame_analysis:
  problem_world: <the part of the world to be transformed — phenomena b, customer-observable>
  requirement_summary: <one-sentence R: desired state of the problem world>
  machine_scope: <what the artifice is and is not — boundary of shared phenomena a>
  given_world_properties: <W: facts of the problem world that hold independently of the machine>
  frame_classification:
    - subproblem: <name>
      frame: enum[required_behaviour, commanded_behaviour, workpieces, information_display, transformation]
      domains: [{name, characterisation: enum[causal, lexical, biddable]}]
      requirement_link: <how R refers to this subproblem's phenomena>
  entailment_check: "S; W ⊢ R — is R reachable from a plausible S using stated W?"
  open_questions: <world properties not yet established>
```

This analysis feeds the problem statement template (see `../stages/s1-business-analysis.md`) and is the anchor for all downstream traceability: every EARS requirement must refer to phenomena b of an identified subproblem, not to machine internals.

### 7.2 Error patterns this module prevents

| Error | Symptom | PF diagnosis |
|:---|:---|:---|
| Solution-first problem statement | "We need a web portal" with no world transformation described | Machine described before problem world exists; jump to Future-How (see `brown-cow.md`) |
| Machine-world conflation | Requirements about tables, screens, APIs | Specification phenomena a mistaken for requirement phenomena b |
| Missing W | Requirement assumed feasible without stated world properties | Entailment S; W ⊢ R cannot be evaluated; feasibility unknowable |
| Unbounded problem | "Improve everything" | Problem world not delimited; no shared phenomena identified |

## 8. Cross-References

- Stage owner: `../stages/s1-business-analysis.md`
- Companion abstraction tool: `./brown-cow.md` (What/How split complements R/S/W split)
- Quality linkage: `./specification-quality.md` §2 (Feasible, Verifiable rest on the entailment)
- Canonical definitions: `../kb/problem-statement-patterns.yaml`
