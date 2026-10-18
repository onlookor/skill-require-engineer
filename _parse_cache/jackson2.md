
## 第 1 页


Softw Syst Model (2005) 4: 189–198 / Digital Object Identiﬁer (DOI) 10.1007/s10270-004-0062-1


Regular papers


Problem frame semantics for software development


Jon G. Hall, Lucia Rapanotti, Michael Jackson


The Open University, Milton Keynes, MK7 6AA, UK
E-mail: J.G.Hall@open.ac.uk


Received: 20 November 2003/Accepted: 28 April 2004
Published online: 29 July 2004 – Springer-Verlag 2004


Abstract. This paper presents a framework for under-
standing Problem Frames that locates them within the
Requirements Engineering model of Zave and Jackson,
and its subsequent formalization in the Reference Model
of Gunter et al. It distinguishes between problem frames,
context diagrams and problem diagrams, and allows us to
formally deﬁne the relationship between them as assumed
in the Problem Frames framework.


knowledge to drive the Requirements Engineering pro-
cess. The graphical notation is helpful here for commu-
nication between the software developer and the problem
owner.


However, a primarily graphical basis has disadvan-
tages [14]. In particular:


– it is hard to interpret graphical artefacts precisely, and


misunderstandings can easily occur;
– it is hard to determine whether a description is com-


The semantics of a problem diagram is given in terms
of ‘challenges’, a notion that we also introduce. The no-
tion of a challenge is interesting in its own right for two
reasons: its proof theoretic derivation leads us to consider
a challenge calculus that might underpin the Problem
Frame operations of decomposition and recomposition;
and it promises to extend the notion of formal reﬁnement
from software development to requirements engineering.


plete and correct;
– it is hard to identify equivalent structures that could


be used interchangeably.


Other graphical notation communities have found that
a formal semantics contributes to a solution, see [7, 11]
and papers in [3] for examples. The semantics pre-
sented in this paper could serve this purpose for Problem
Frames. To the best of our knowledge, a semantics of
Problem Frames is missing from the literature, although
a partial formal characterization of some early work on
Problem Frames is given in [1].


In addition, the semantics supports a textual repre-
sentation of the diagrams in which Problem Frames cap-
ture problems and their relationship to solutions. This
could open the way for graphical Problem Frames tools.


Our semantics places Problem Frames within Zave
and Jackson’s framework for Requirements Engineer-
ing [15]. In particular we focus on the relationship be-
tween Problem Frames and expressions of the form


Keywords: Requirements engineering – Problem Frames
– Semantics – Reference model – Framework


K, S ⊢R


1 Introduction


(where K is a description of the problem domain, S is the
speciﬁcation of the solution, and R is the problem require-
ment). This relationship connects the Problem Frames
framework to the Reference Model for requirements and
speciﬁcations given by Gunter et al [5] and more recently,
Hall and Rapanotti [6], in which control and other inter-
action properties are given expression.


Problem Frames [8, 9] classify software development
problems. In their intention they are akin to design pat-
terns [4, 10], but for describing problems, not solutions.
Problem Frames structure the world in which the prob-
lem is located – the problem domain – and describe what
is there and what eﬀects a system located there must
achieve. By emphasising problems rather than solutions,
Problem Frames can exploit the understanding of a prob-
lem class, allowing a problem owner with speciﬁc domain


The semantics has many interesting characteristics.
For instance:


## 第 2 页


190
J.G. Hall et al.: Problem frame semantics for software development


– It represents the structure of a Problem Frames arte-


A computer system is required to control the cat-
alyst unit and cooling system of a chemical reac-
tor. An operator issues commands for activating
or deactivating the catalyst unit; in response to
such commands, the system instructs the unit ac-
cordingly and regulates the ﬂow of cooling water.
A gearbox is attached to the system: whenever the
oil level in the gearbox is low, the system should
ring a bell and halt execution.
This problem is a simpliﬁed version of a chemical reactor
described in [2, 12].


fact at a level above the detail of domain descriptions;
for instance, it can accommodate the description of an
‘operator’ domain’s behaviour as


‘The operator smokes’.


In this sense, our representation of the Problem Frame
artefacts comes from the tradition of the propositional
calculus: we represent and manipulate only the struc-
ture above the level of domain descriptions. Of course,
as with the propositional calculus – from which the
predicate calculus is reached through the formalisa-
tion of propositions – so too, in principle, our seman-
tics is extensible wherever more formal domain de-
scriptions exist.
– We deﬁne a formal syntax for Problem Frames, under-


2.1 Problem diagrams


Within the PF framework, a problem diagram deﬁnes the
‘shape’ of a problem by capturing the characteristics and
interconnections of the parts of the world it is concerned
with. A problem diagram also includes the requirements
that constrain the relationships between these parts. The
problem diagram for our Chemical Reactor Controller
problem is shown in Fig. 1.


pinning the semantics and anchoring the graphical no-
tation. This syntax opens the way for graphical Prob-
lem Frames tools and for electronic transformation
and communication of Problem Frames artefacts.
– The meaning of a problem diagram is given in terms of


‘challenges’ – a formal notion that abstracts the solu-
tion S from K, S ⊢R tuples. The notion of a challenge
is interesting in its own right for at least two rea-
sons. Its proof theoretic derivation leads us to consider
a challenge calculus that might underpin the Problem
Frame operations of decomposition and recomposi-
tion, as well as the associated correctness arguments;
and it promises to extend the notion of (formal) reﬁne-
ment from program development through to require-
ments engineering.
– The formal semantics for Problem Frames provides


The components are:
– A double-barred box (Operation Machine): the ma-


chine domain, i.e., the software system to be built
together with its underlying hardware.
– A box (the Operator domain): the human operator.


Human operators are regarded as biddable in the
Problem Frames framework: they may obey stipulated
procedures, but not reliably, and may generate events
spontaneously.
– Other boxes (Cooling System, Catalyst, etc.): given


domains representing parts of the world that are rele-
vant to the problem. Each of these domains is causal:
i.e., its phenomena are physical events and states, and
are causally related;
– A dotted oval (Control): the requirement, i.e., the con-


a clear overall structure for artefacts and their re-
lationships within a Problem Frames development.
Although persuasive arguments for the soundness of
a development can be based solely on its rigour or
formality, a clear overall structure is always the es-
sential foundation. Without a clear overall structure,
even a collection of perfectly formal and convincing
arguments at the detailed level will not add up to
a demonstration that a development is sound.


dition in the problem domain that the Operation Ma-
chine must guarantee to qualify as a solution to the
problem.
– The annotated connections between domains: these


indicate shared phenomena, including events, opera-
tions and state information. In Fig. 1, for example,
the connection between the Operation Machine and
the Cooling System is annotated by the set d con-
taining the two phenomena increase_wateract and
decrease_wateract. These represent commands gen-
erated by the Operation Machine in order to in-
crease or decrease the water level in the Cooling Sys-
tem. Phenomena shared between two domains are
observable by both, but controlled by one of them
only. For instance phenomena increase_wateract and
decrease_wateract are both controlled by the Opera-
tion Machine: this is indicated by an abbreviation of
the domain name followed by !, in this case OM!.
– The annotated connections between the requirement


This paper is organised as follows. Section 2 out-
lines the Problem Frames framework. A comprehensive
introduction to Problem Frames is beyond the scope of
this paper and can be found in [9]. Section 3 recalls the
Reference Model of [5]. Section 4 introduces the seman-
tics. Finally, Section 5 brieﬂy comments on the nature
of the semantics and indicates the direction of future
work.


2 The Problem Frames framework


In this section we review some of the basic elements of
the Problem Frames (PF) framework. To focus our review
we describe the PF development of the following problem,
a Chemical Reactor Controller:


and the domains: a dashed line indicates that the re-
quirement references its phenomena, while a dashed


## 第 3 页


J.G. Hall et al.: Problem frame semantics for software development
191


a :OP!{open_catalyst, close_catalyst}
e : CS!water_level
b :OM!{open_catalystact, close_catalystact}
f : GB!request_service
CA!{is_opensen, is_closedsen}
g : OM!ring_bell
c :CA!{open, closed}
h : AL!bell_ringing
d :OM!{increase_wateract, decrease_wateract}
i : GB!oil_level
CS!{is_risingsen, is_fallingsen}


Fig. 1. The chemical reactor problem diagram


arrow indicates that the requirements constrains
the phenomena. For instance, the oil_level in the
GearBox is referenced by the requirement, while the
bell_ringing in the Alarm is constrained.


– optative, expressing what is required or desired to be


true.
Descriptions of given domains, then, play an indicative
role, while the requirement description and machine spe-
ciﬁcation are optative.


As well as biddable and causal, domains can also be
lexical; a lexical domain reiﬁes a data structure, in some
cases a text. The phenomena of biddable domains are
events; those of causal domains are states and events
(generalised as causal phenomena); and those of lexical
domains are symbolic.


Also provided separately from the diagram are the
designations of phenomena, which ground the prob-
lem’s vocabulary in the physical phenomena. For in-
stance, through their designations, open_catalyst and
close_catalyst will denote physical command actions
that the operator can actually perform; is_risingsen and
is_fallingsen will denote states that can be captured by
sensors.


Not included in the diagram, but an essential part of
the problem deﬁnition, are the descriptions of all given
domains and the details of the requirement. Typically, as
the development progresses, detail of a machine speciﬁca-
tion would be added. All of these descriptions would be
recorded elsewhere, rather than added to the diagram. An
important point is that the framework does not prescribe
the notation to be used for these descriptions; formal and
informal descriptions are equally acceptable, provided
they are precise enough to capture the characteristics of
interest of the various respective domains. This freedom
motivates the propositional nature of our semantics: the
satisfaction of a description, for example by a domain, can
be abstracted as a proposition.


2.2 Problem frames


One of the aims of the PF framework is to identify basic
classes of problem that recur throughout software devel-
opment. Reference [9] identiﬁes ﬁve such basic problem
classes, or problem frames, including the commanded be-
haviour frame, the required behaviour frame and the in-
formation display frame, which we use here (or later) for
illustration. A problem frame acts as a template for recog-
nising problems in its class. In form, a problem frame is
simply a problem diagram, annotated with domain and
phenomena markings, and associated with a correctness
argument template. To match a problem frame template,
a problem must:


The PF framework distinguishes two fundamental
roles of descriptions:


– indicative, expressing what is given or assumed to be


– match the problem topology – as captured in the prob-


true, and


lem frame diagram;


## 第 4 页


192
J.G. Hall et al.: Problem frame semantics for software development


– The causal Catalyst, matching the Controlled domain


– match the domain characteristics – as captured by the


domain markings in the problem frame diagram (B for
biddable, C for causal, and Y for lexical);
– match the characteristics of the shared phenomena –


in the frame.
– The biddable Operator, matching the Operator in


the frame. The operator controls and issues com-
mands spontaneously as event phenomena, shared
with the Control machine. These event phenomena
are open_catalyst and close_catalyst.
– The requirement determining the response of the Con-


as captured by the markings on the connections (E for
events, C for causal and X for symbolic); and
– support a way of building and discharging a cor-


rectness argument which matches the correctness
argument template for the problem class. For the
commanded behaviour frame, the form of the argu-
ment will exploit explicitly stated causal properties of
the controlled domain to show that the machine be-
haviour in terms of the phenomena E4, C1 and C2 will
cause the required behaviour of the controlled domain
in terms of the phenomena C3. The reader interested
in the detail of the correctness argument template
should consult [9].


trolled domain to the Operator’s commands. The re-
quired behaviour is expressed in terms of the causal
phenomena is_opensen and is_closedsen.


2.3 Problem decomposition


Most real problems are too complex to ﬁt basic problem
frames. They require, rather, decomposition into a collec-
tion of interacting sub-problems, each of which is smaller
and simpler than the original. The projection of the prob-
lem diagram of Fig. 1 that matches the commanded be-
haviour frame represents one such sub-problem.


The commanded behaviour frame is shown as the an-
notated problem diagram in Fig. 2.


By comparing Figs. 2 and 1, the reader will see that
the commanded behaviour frame matches the projection
of the problem diagram consisting only of these parts:


Within the PF framework, we identify sub-problems
from their problem frame templates, and instantiate the
corresponding sub-problem diagrams. Our semantics al-
lows us to express the relationship between problems and
sub-problems; we will brieﬂy illustrate this process for the
chemical reactor.


– The Operation Machine, matching the Control ma-


chine in the frame.


Fig. 2. The commanded behaviour frame


a : OP!{open_catalyst, close_catalyst}
b : OM!{open_catalystact, close_catalystact}


CA!{is_opensen, is_closedsen}
c : CA!{open, closed}


Fig. 3. The Control Catalyst sub-problem, an instantiated


commanded behaviour frame


## 第 5 页


J.G. Hall et al.: Problem frame semantics for software development
193


d : OM!{increase_wateract, decrease_wateract}


CS!{is_risingsen, is_fallingsen}
e : CS!water_level


Fig. 4. The Regulate Cooling System sub-problem,


an instantiated required behaviour frame


f : GB!request_service
g : OM!ring_bell
h : AL!bell_ringing
i : GB!oil_level


Fig. 5. The Raise Alarm sub-problem, an instantiated


information display frame


The chemical reactor problem can be decomposed into
three distinct sub-problems:


between them. From a requirements engineering view-
point, the key artefacts are the following1: the domain
knowledge, K, is what we know about the environment;
the requirement, R, is what the customer requires of
a system working within the environment; and the speci-
ﬁcation, S, is a description of the system, which can be
used for its implementation.


– a commanded behaviour frame allowing the operator


to control the catalyst;
– a required behaviour frame regulating the water ﬂow


for cooling; and
– an information display frame for issuing a warning


The Reference Model formalises the relation [15] be-
tween world, requirements and machine as:


(and halting the system) when there is an oil leak in
the gearbox.
To be able to apply the problem frames as templates,
the domains and phenomena of the problem must match
those of the frame. The instantiation of a problem frame
for a speciﬁc problem results in the sub-problem diagram
that was matched by the problem frame. In the Chemical
Reactor problem, the instantiation of the commanded be-
haviour frame is the problem diagram of Fig. 3; that of the
required behaviour frame is given in Fig. 4; and that of
the information display frame in Fig. 5.


K, S ⊢R


That is: a proof can be given that an implementation of
S, introduced into a problem domain satisfying K, will
guarantee satisfaction of the requirement R.


In the Reference Model, designations are used to
ground terms in the real world [15]. The designations pro-
vide names to describe the environment, the system and
their artefacts. The vocabulary is used to name phenom-
ena, which are grouped into: those denoted by e, which
belong to, and are controlled by, the environment; and
those, denoted by s, which belong to, and are controlled
by, the system (or machine). e is further partitioned into
phenomena which are visible to (or observable by) the
machine (ev), and those that are hidden from it (eh); s is
further partitioned into phenomena which are visible to
(or observable by) the environment(sv), and those that


3 The reference model


In the section we brieﬂy recall the Reference Model,
which underpins our semantic characterisation of Prob-
lem Frames.


The Reference Model [5, 6, 15] is based on the widely
accepted separation between the system (which we call
the machine) and its environment (which we call the
problem domains); on a number of key artifacts which
pertain to the two; and on a vocabulary, which is used
to describe the environment, the system and the interface


1 Other artefacts are deﬁned in the Reference Model, which per-
tain to design and implementation. They are beyond the scope of
this article, and are omitted here.


## 第 6 页


194
J.G. Hall et al.: Problem frame semantics for software development


are hidden from it (sh). ev ∪sv is the vocabulary of the
interface between the environment and the machine.


resenting, respectively, all domains, all machine domains,
all requirements and all phenomena:


For technical reasons, the Reference Model assumes
that the speciﬁcation, S, is written in the interface vocab-
ulary: i.e., S can use only terms denoting phenomena in
ev ∪sv. On the other hand, K and R can use terms denot-
ing phenomena in e∪sv.


PFDomain, PFMachine, PFRequirement, PFPhenomena


For the grounding of a problem, both domains and re-
quirements must have names and descriptions in DRDL2:


PFDomainName △
−PFDomain→DRDL
PFDomainDescription △
−PFDomain→DRDL
PFRequirementName △
−PFRequirement→DRDL
PFRequirementDescription △
−PFRequirement→DRDL


4 Towards a semantics for Problem Frames


In this section we describe the semantics in terms that
we have already introduced. The semantics begins with
a non-graphical representation language for the elements
of the PF framework. This is based on the (uninter-
preted) Domain and Requirements Description Language
(DRDL) which is used to express requirements and do-
main properties – our equivalents of basic propositions.
We then build problem diagrams and problem frames
upon this, in the Problem Frames Description Language
(PFDL). Then we deﬁne problem frame instantiation,
and ﬁnish with the interpretation of decomposition and
recomposition.


Phenomena are also named and described in the
DRDL:


PFPhenomenaDesignation△
−PFPhenomena →DRDL


Phenomena are partitioned in sets of phenomena that
can be either controlled or observed by each domain and
the machine:


PFControlled △
−PFDomain∪PFMachine →PFPhenomena
PFObserved △
−PFDomain∪PFMachine →PFPhenomena


Similarly, some phenomena can be either constrained or
referenced by the requirement:


4.1 PFDL: a description language for Problem Frames


We introduce a textual notation for Problem Frames, the
Problem Frames Description Language (or PFDL). The
purpose of this notation is to provide a (textual) syntactic
domain on which to deﬁne our semantic function.


PFConstrained △
−PFRequirement →PFPhenomena
PFReferenced △
−PFRequirement →PFPhenomena


We will bundle all annotating functions into a problem di-
agram annotation:


As discussed earlier, we assume that some language
(or a collection of languages) has been chosen for the de-
scription of domains, phenomena, requirements and spe-
ciﬁcations – these are the ‘basic propositions’ of our se-
mantics. This we refer to as the Domain and Requirement
Description Language (or DRDL, for short). We assume
only that DRDL:


PFAnnotation △
−
(PFDomainName, PFDomainDescription,


PFRequirementName, PFRequirementDescription,
PFPhenomenaDesignation, PFControlled,
PFObserved, PFConstrained, PFReferenced)


– allows the representations of phenomena and their re-


lationships, can distinguish controlling inﬂuence over
them from observation of their values, and can mark
phenomena and domains appropriately;
– comes equipped with some notion of reasoning, which


(For brevity, if A is the problem diagram annotation, we
will refer to the nine annotating functions as A1, . . . , A9,
where A1 is the domain names annotation, A2 is the do-
main descriptions annotation, and so on.)


we will refer to as ⊢DRDL (or simply as ⊢when the
context makes this clear).


A problem diagram is a set of domains, a single ma-
chine, a single (set of) requirement(s), and an annotation,
i.e.:


We do not require the reasoning of ⊢DRDL to be formal in
any proof theoretic sense. It may be, for instance, that the
reasoning takes a pragmatic software engineering form,
such as testing. We return to this point in Sect. 5.


PFProblemDiagram △
−(P PFDomain, PFMachine,


PFRequirement, PFAnnotation)


The correspondence between the graphical elements
of a problem diagram and their PFDL counterpart is il-
lustrated in Fig. 6.


4.1.1 Describing problem diagrams


The basic components of problem diagrams are domains
(including machine domains), requirements and their
connectivity through arcs and annotations. To be able to
express this in PFDL, we assume the following sets, rep-


2 We will often identify the domain with its name. This requires,
of course, that the mapping from domains to names is injective.
Similarly with requirements and phenomena.


## 第 7 页


J.G. Hall et al.: Problem frame semantics for software development
195


Graphical element


Element


Name


Controlled/


Observed/


Constrained


Referenced


M


Machine


a


b


D


Domain


b


a


R


Requirement


a


R


Requirement


a


Fig. 6. The relationship between the graphical elements of a problem diagram and their counterpart in the PFDL


As an example, let (D1, . . . , D5, M, R, A), where A =
(A1, . . . , A9), be the problem diagram for the chemical
reactor problem. Then its PFDL description, in tabular
form, is shown in Fig. 7.


markings. These markings must be matched by prob-
lem diagram elements for the problem frame template to
apply.


Each domain can be marked as biddable (B), lexical
(X) or causal (C):


4.1.2 Describing problem frames


PFDomainMarking △
−PFDomain →{B, X, C}


As already mentioned, basic problem frames are tem-
plates for classes of problems. Reference [9] provides
a template language enriched over that for problem di-
agrams by the introduction of domain and phenomena


Each (set of) phenomena can be marked as causal (C),
symbolic (Y) or event (E):


PFPhenomenaMarking △
−PFPhenomena →{C, Y, E}


Name


Controlled/Constrained


Observed/Referenced


M


Operation Machine


open_catalystact, close_catalystact


is_opensen, is_closedsen


increase_wateract, decrease_wateract


is_risingsen, is_fallingsen


ring_bell


request_service


open_catalyst, close_catalyst


D1


Catalyst


is_opensen, is_closedsen


open_catalystact, close_catalystact


open, closed


D2


Cooling System


is_risingsen, is_fallingsen


increase_wateract, decrease_wateract


water_level


∅


D3


Operator


open_catalyst,close_catalyst


∅


D4


GearBox


request_service


oil_level


D5


Alarm


bell_ringing


ring_bell


R


Control


open, closed


open_catalyst, close_catalyst


water_level


oil_level


bell_ringing


Fig. 7. The chemical reactor problem diagram in tabular form


## 第 8 页


196
J.G. Hall et al.: Problem frame semantics for software development


The diagram of a problem frame is called a frame dia-
gram and is a problem diagram augmented with markings
for domains and phenomena:


domain) over some DRDL, we deﬁne a ‘challenge to ﬁnd
a satisfying speciﬁcation’ as


c, o : [K, R] = {S | S controls c ∧S observes o


PFFrameDiagram△
−(PFProblemDiagram,
PFDomainMarking, PFPhenomenaMarking)


∧K, S ⊢DRDL R}


As such, c, o : [K, R] stands for the set of all those speciﬁ-
cations that control phenomena in the set c, and observe
phenomena in the set o, and are capable, in the context
of K, of discharging R, as per [5, 6, 15]. As indicated in
the notation, the details of ⊢DRDL will be provided by the
DRDL. We also note that c, o : [K, R] can be empty (as
when R is false, for instance), in which case there is no
satisfying speciﬁcation, i.e., the system cannot be built.
Referring to the original Reference Model, c = sv, i.e., the
machine controlled phenomena shared with the environ-
ment, and o = ev, the machine visible shared phenomena.


A problem frame provides a frame concern, i.e., a tem-
plate for correctness arguments that is common to all
problems of that class. We assume that frame concerns
are taken from another given set:


PFFrameConcern


and so we may deﬁne:


PFProblemFrame△
−(PFFrameDiagram, PFFrameConcern)


To derive the challenge which stands as semantics
for a particular problem diagram, one must only look
to its PFDL description. Given a problem diagram
({D1, . . . , Dn}, M, R, A), with A = (A1, . . . , A9), in the
semantics, for convenience we deﬁne its challenge as


A PFDL representation of the commanded behaviour
frame of Fig. 2 is given in Fig. 8 (we have omitted the
frame concern). The reader will note that the phenomena
controlled by the operator are event phenomena (mark-
ing E), while all other phenomena are causal (marking C);
such markings will constrain the applicability of the prob-
lem frame to a problem diagram.


c, o : [DD1 ∧. . .∧DDn, DR]


where:


4.2 Problem diagrams as challenges


– DDi = A2(Di) – the problem diagram’s domain de-


scriptions;
– DR = A4(R) – the problem diagram’s requirement de-


As in program reﬁnement [13], in which pre and post con-
ditions deﬁne a ‘challenge’ to develop code to implement
them, so a problem diagram, through its environment
and requirements, deﬁnes a challenge to develop a ma-
chine speciﬁcation to solve them. Whereas reﬁnement is
mature, and has formal notation capable of representing
a challenge3 we, as yet, do not. We will therefore be forced
to improvise, notationally, somewhat.


scription;
– c = A6(M) – those phenomena controlled by the prob-


lem diagram’s machine domain;
– and o = A7(M) – those phenomena visible to the prob-


lem diagram’s machine domain.
The reader will note that discharging the correctness
argument associated with the diagram is part of the chal-
lenge: speciﬁcally, demonstrating that K, S ⊢DRDL R,
that S controls c, and that S observes o.


We use the following deﬁnition as the basis for our
semantics. Given a world description K, a requirement
description R, and sets of shared phenomena c (controlled
by the machine domain) and o (observed by the machine


4.3 Instantiation as injection


3 The reader may be familiar with the reﬁnement notation
w : [pre, post] which stands for (all) code that, by changing only
variables in w, will take as input any state satisfying pre and pro-
duce a state satisfying post.


A problem frame is a template for a class of problems.
By ‘applying’ a problem frame to a problem diagram, we


Name


Marking for


Marking for Controlled/


Marking for Observed/


Domain


Constrained Phenomena


Referenced Phenomena


−−


M


Control Machine


C1


C2, E4


D1


Controlled Domain


C


C2, C3


C1


∅


D2


Operator


B


E4


−−


R


Commanded Behaviour


C3


E4


Fig. 8. PFDL description of the commanded behaviour frame


## 第 9 页


J.G. Hall et al.: Problem frame semantics for software development
197


can derive a (sub-)problem diagram whose semantics is
a challenge. This allows for a process of problem decom-
position in which the sub-problem diagrams are projec-
tions of the original problem diagram through appropri-
ately chosen problem frames.


forwards argument (downwards in Fig. 9) requires that
composition concerns are identiﬁed and the associated
proof obligations are discharged.


In the Chemical Reactor problem, for instance, there
is a requirement that when the oil level in the gearbox is
low, the machine should sound an alarm and halt (the in-
formation display sub-problem). On the other hand, the
machine is always required to regulate the cooling system
(the required behaviour sub-problem). The composition
of these two apparently conﬂicting sub-problems must
continue to guarantee the safe functioning of the reactor.
This concern must therefore be addressed at the compo-
sition level, perhaps by reconsidering one or both of these
requirements.


Semantically, we can see the application of a prob-
lem frame to a problem diagram as matching domains
and connections (i.e., the topology), and the types of
the domains and phenomena. We say that a frame dia-
gram PF = (D, M, R, A, DM, PM) matches a problem
diagram PD = (D′, M ′, R′, A′) when there is an injective
correspondence ι : D →D′ which respects the topology,
domain and phenomena types.


A problem frame instantiation is then the application
of ι to (D, M, R, A, DM, PM).


The indication that requirements are in conﬂict can
be taken from the backwards development of the chal-
lenges. The binding of symbols that occurs throughout
the tree through backwards development may lead to
a situation in which the recomposition concern cannot be
discharged. This is natural in such proof theoretic frame-
works. By analogy, sometimes, when we start from a un-
provable ‘theorem’, it is because the ‘theorem’ contains
a contradiction and the ‘theorem’s’ statement must be
rethought. As with system development through problem
frames, conﬂicting requirements may prevent the system
being built. When we are made aware of such require-
ments – because the challenge cannot be met – we must
reconsider them, and formulate diﬀerent, non-conﬂicting
requirements.


4.4 Addressing composition and recomposition


Extending the analogy with program reﬁnement, working
towards an S ∈c, o : [K, R] will be an exploration of the
design choices at each stage: because we work within all
of software – including architectures, etc – and not just
within code, the design space is possibly much larger than
that in reﬁnement.


Problem frames, as templates, allow us to navigate
the design space by dividing up the problem. For ex-
ample, in the Chemical Reactor problem, we have three
sub-problem diagrams corresponding to the required be-
haviour, commanded behaviour, and information display
frames. The decomposition of this problem into three sub-
problems is illustrated in Fig. 9, in which:


5 Discussion and future work


c1={open_catalystact, close_catalystact}
o1={is_opensen, is_closedsen,


In this paper we have provided a semantics for elements
of the PF framework. We have introduced the Problem
Frames Description Language (PFDL), over a Domain
and Requirements Description Language (DRDL), for
the description of problem diagrams and problem frames.
We have deﬁned the meaning of a problem frame as a tem-
plate for problem diagrams, and a semantics for problem
diagrams within the Reference Model, given in terms of
challenges of the form c, o : [K, R], a notion that we have
also introduced.


open_catalyst, close_catalyst}
c2={increase_wateract, decrease_wateract}
o2={is_raisingsen, is_fallingsen}


c3={ring_bell}
o3={request_service}


c=c1 ∪c2 ∪c3
o=o1 ∪o2 ∪o3


As in reﬁnement, given a possible decomposition
through the application of problem frames, there will be
a corresponding composition concern analogous to reﬁne-
ment’s veriﬁcation condition: we must be able to convince
ourselves of the validity of the recomposition. Our point
is that the backwards argument (upwards in Fig. 9) iden-
tiﬁes the sub-problems that must be solved, while the


We stress that our semantics is based on a weak notion
of correctness. In this we diﬀer from the Reference Model
semantics, which is based on universal quantiﬁcation over
all ‘phenomenon sequences’. The actual wording used by
the authors is:


c1, o1 : [{Catalyst, Operator}, Control Catalyst]


c2, o2 : [{Cooling System}, Regulate Cooling System]


c3, o3 : [{Alarm, GearBox}, Raise Alarm]


c, o : [{Catalyst, Cooling System, Operator, Alarm, GearBox}, Control]
↑Decomp., ↓Recomp.


Fig. 9. The decomposition/recomposition relationship between the Chemical reactor problem diagram


and its sub-problem diagrams


## 第 10 页


198
J.G. Hall et al.: Problem frame semantics for software development


A requirement with an environment constraint
should always be veriﬁed by a demonstration or
proof that speciﬁed properties, conjoined with do-
main knowledge, guarantee the satisfaction of the
requirement.


In our semantics we relax that notion of proof to its weak-
est (non-technical) meaning:


Fig. 10. The move between problem


and solution domains (after


[13, Fig. 1.6, p. 9])


facts, evidence, argument, etc. establishing or
helping to establish a fact.


We might, with this deﬁnition, also admit proofs of the
type ‘an extensive search has found no case in which
the system did not satisfy the requirements’ (a testing
‘proof’); or the ‘customers were convinced by the ar-
guments of the developers’; or ‘a formal reﬁnement of
the requirements to code was performed, with all ver-
iﬁcation conditions being discharged’; or ‘Dijkstra pro-
grammed it’; even ‘we’ll ﬁx it in the next release’ might
do. Clearly, the nature of ⊢DRDL and that of the require-
ments are closely related: where the requirements include
human safety (as may be the case in a critical system), the
strength of ⊢DRDL must provide for an appropriate level
of proof.


References


1. Bjorner D, Koussoube S, Noussi R, Satchok G (1997) Michael
Jackson’s problem frames: Towards methodological principles
of selecting and applying formal software development tech-
niques and tools. In: 1st IEEE International Conference on
Formal Engineering Methods. IEEE Computer Society Press
2. Dieste O, Silva A (2000) Requirements: Closing the gap be-
tween domain and computing knowledge. In: Proceedings of
SCI2000, Vol. II (Information Systems Development)
3. Evans A, Bruel J-M, France R, Lano K, Rumpe B (1998) Mak-
ing UML precise. In: Andrade L, Moreira A, Deshpande A,
Kent S (eds) Proceedings of the OOPSLA’98 Workshop on
Formalizing UML. Why? How?
4. Gamma E, Helm R, Johnson R, Vlissides J (1995) Design Pat-
terns. Addison-Wesley
5. Gunter C, Gunter E, Jackson M, Zave P (2000) A reference
model for requirements and speciﬁcations. IEEE Software
3(17):37–43
6. Hall JG, Rapanotti L (2003) A Reference Model for Require-
ments Engineering. In: Proceedings of the 11th International
Joint Conference of Requirements Engineering
7. Harel D, Naamad A (1996) The STATEMATE semantics of
statecharts. ACM Transactions on Software Engineering and
Methodology 5(4):293–333
8. Jackson M (1995) Software Requirements & Speciﬁcations:
a Lexicon of Practice, Principles, and Prejudices. Addison-
Wesley
9. Jackson M (2001) Problem Frames. Addison-Wesley
10. Konrad S, Cheng BH (2002) Requirements patterns for em-
bedded systems. In: IEEE Joint International Conference on
Requirements Engineering
11. Larsen PG, Plat N, Toetenel H (1994) A formal semantics
of data ﬂow diagrams. Formal Aspects of Computing 6(6):
586–606
12. Leveson N (1986) Software safety: why, what and how. ACM
Computing Survey 18(2):125–163
13. Morgan C (1990) Programming from Speciﬁcations. Prentice-
Hall International
14. Petre M (1995) Why looking isn’t always seeing: reader-
ship skills and graphical programming. Commun. ACM 38(6):
33–44
15. Zave P, Jackson M (1997) Four dark corners of requirements
engineering. ACM Transactions on Software Engineering and
Methodology 6(1):1–30, January


The development of the challenge expression c, o :
[K, R] needs many things. Most importantly, the avail-
ability of a ‘weakest environment predicate transformer’
(analogous to the weakest precondition semantics of re-
ﬁnement) would place the semantic basis of the manipu-
lation of such expressions on a much ﬁrmer footing, and
even lead us towards a requirements engineering notion of
‘reﬁnement’ that forms a lattice over such objects; given
a problem, the reﬁnement relation ⊑would justify the re-
lationship, summarised in Fig. 10:


problem ⊑partial_soln0 ⊑. . . ⊑speciﬁcation


Finally, we observe that this paper provides a basis for
a formal semantics for elements of the PF framework. The
range of uses to which it can be put is still largely unex-
plored, and will provide a focus for further research.


Acknowledgements. We acknowledge the kind support of our col-
leagues, especially Bashar Nuseibeh and Robin Laney, in the De-
partment of Computing, the Open University. Also, we thank the
anonymous reviewers, whose comments have helped us to improve
the paper greatly.
