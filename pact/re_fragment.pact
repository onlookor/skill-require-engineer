// =====================================================================
// PACT Fragment: Requirements Engineering (rev2)
// =====================================================================
// Paradigm : PACT v1 rev2 — Precondition-governed Autonomous Counter-based
//            Token paradigm. 文法依据 docs/pactv1_rev2.md §3.1；
//            组合条件依据 §1.8 C1–C4。
// Position : 需求工程片段。business_goal 与 change_request 是本片段的两个
//            源类型（Precond = ∅），只能经 Rule-S 由 seed 权威注入，任何
//            参与者都不得持有 produces 子句（§3.1 约束 6 Source-Production）。
//            因此" elicitation（获取）"在 PACT 中不是内部生产，而是注入：
//            business_goal 由 product_owner 播种，change_request 由
//            change_requester 播种（stages/s6 Step 1：无请求人/无来源的变更
//            请求按 ungrounded 驳回，故其进入方式必须是 seed 而非生产）。
// Interface: re_baseline 是与下游（软件工程片段）的组合接口类型（§1.8
//            Sequential composition through type sharing）。本片段声明其
//            前置规则；下游片段只声明类型、不重复声明规则（§1.8 C2 / D18
//            单侧声明语义），也不得持有 produces re_baseline（C4）。
//
// Companion content layer（PACT 只规定结构，不规定内容 — §1.3）：
//   stages/s1-business-analysis.md -> business_goal 的 seed 内容生产
//   stages/s2-elicitation.md       -> business_goal -> raw_requirement
//   stages/s3-analysis.md          -> raw_requirement -> specification（子步 1）
//   stages/s4-specification.md     -> raw_requirement -> specification（子步 2）
//   stages/s5-validation.md        -> specification -> validation_report -> re_baseline
//   stages/s6-management.md        -> change_request -> change_impact_report
//                                     -> change_approval -> 新 specification
//   validators/schemas/*.json      -> 各 Token 类型的 ThingRef 载体 schema
//
// 结构不表达的维度（一律落配套层，禁止在此造语法）：
//   频次/时限（如"同一变更请求连续 3 轮未过闸则升级项目负责人"）、
//   概率与模糊判据、OR 路由（approve/reject/defer 三分支中只有 approve
//   产生 Token；reject 与 defer 在 PACT 中表现为"不产生任何 Token"，
//   即 §1.4 零隐式动作）。
// =====================================================================

types {
    // —— 源类型（只能 seed，不可 produce）——
    business_goal;           // 业务目标：S1 的 seed 内容
    change_request;          // 变更请求：S6 Step 1 登记，须带请求人与来源
    // —— 正向链 ——
    raw_requirement;         // Precond: business_goal
    specification;           // Precond: raw_requirement
    validation_report;       // Precond: specification
    re_baseline;             // Precond: validation_report（组合接口类型）
    // —— 变更环（S6）——
    change_impact_report;    // Precond: change_request（影响分析，读 re_baseline）
    change_approval;         // Precond: change_impact_report（CCB 人类批准）
}

// ---------------------------------------------------------------------
// 结构轴一：前置图（只约束 Rule-P）
// ---------------------------------------------------------------------
// 不变式：
//   - 前置唯一性：每个类型至多一条前置规则；AND 语义，无 OR 分支（§1.4.4）。
//   - 源类型只由规则缺席定义：business_goal / change_request 无规则，
//     被排除在 Rule-P 之外，从而保证终止性良定义（§1.4 Rule-P 前提）。
//   - 变更环不构成前置图环：change_request 链终止于 change_approval，
//     由 change_controller 消费后重新生产 specification（复用既有规则
//     raw_requirement -> specification），因此 raw_requirement 不得被
//     提前消费（见下方 gate 注释与 A.6 搁浅风险）。
preconditions {
    business_goal → raw_requirement;
    raw_requirement → specification;
    specification → validation_report;
    validation_report → re_baseline;
    change_request → change_impact_report;
    change_impact_report → change_approval
}

// ---------------------------------------------------------------------
// 结构轴二：gate 矩阵（约束 Rule-R 与 Rule-E 准入）
// ---------------------------------------------------------------------
gates {
    // —— 正向链参与者 ——
    // consumes business_goal：获取完成即退役该 seed token（归档留痕）。
    business_analyst:      consumes business_goal,
                           produces raw_requirement;

    // 不持有 consumes raw_requirement：变更环需要 raw_requirement 仍在
    // Counter 上才能重新生产 specification（Rule-P 前提 Precond(T) ⊆ Counter）。
    // 提前消费将造成 validator 的 via 见证搁浅（§A.6）与变更环死锁。
    requirements_engineer: reads raw_requirement,
                           produces specification;

    // via raw_requirement：内建 gate 条件（§1.4.0 GateHolds）。溯源敏感 —
    // 见证必须是 specification.depends_on 中记录的那个 raw_requirement 实例
    // 且仍在 Counter 上；若已归档则读取被阻塞 → 报告，不得重建。
    validator:             reads specification via raw_requirement,
                           consumes specification,
                           produces validation_report;

    release_manager:       reads validation_report,
                           consumes validation_report,
                           produces re_baseline;

    // —— 变更环参与者（S6）——
    // 影响分析以现行基线为起点（reads re_baseline，非破坏），消费变更请求。
    change_analyst:        reads re_baseline,
                           reads change_request,
                           consumes change_request,
                           produces change_impact_report;

    // CCB 批准是人类专属（stages/s6 Step 4；反模式"Agent decides approval"）。
    // 结构保证：change_approval 只能由 ccb 生产，且其前置是 change_impact_report
    // → 无影响分析则无批准（Wiegers Ch.28 policy 2/3）。
    ccb:                   reads change_impact_report,
                           consumes change_impact_report,
                           produces change_approval;

    // 消费旧基线与批准凭据，生产新 specification（旧 Token 入 Archive，
    // 永不就地修改 — stages/s6 反模式"In-place edit of baseline"）。
    change_controller:     reads re_baseline,
                           reads change_approval,
                           consumes re_baseline,
                           consumes change_approval,
                           produces specification;

    // —— 横切角色（只读，永不生产/消费 — §Part II Ch.2 模式）——
    auditor:               reads specification,
                           reads validation_report,
                           reads re_baseline
}

// ---------------------------------------------------------------------
// seed 权威（源类型的唯一进入机制，Rule-S）
// ---------------------------------------------------------------------
seed_authority {
    product_owner:     seeds business_goal;
    change_requester:  seeds change_request
}

// =====================================================================
// 本片段依赖的 PACT 不变式（不得违反）
// =====================================================================
// 1. 零隐式动作：每次 Counter 变化都是显式参与者动作（Rule-P/R/E/S）。
//    消费 specification 不会自动触发下游阶段；CCB 驳回/延期不产生 Token。
// 2. 读取非破坏：多个参与者可读同一 Token，Counter 不变（auditor 永不消费）。
// 3. 消费纯显式：Rule-E 将 Token 移入不可变 Archive，无级联、无引用计数。
// 4. 变更协议：变更永非就地修改 — change_controller 消费旧 Token（入 Archive）
//    并生产新 Token；审计链由 Archive 的 exhausted_at / exhausted_by 承担
//    （新 specification 的 depends_on 记录 raw_requirement，不记录 change_approval
//    — 这是 rev2 前置唯一性约束下的已知表达边界，见配套文档）。
// 5. 搁浅防护：消费任何被 gate 以 via 读取的 Token 前，须确认无参与者会被阻塞；
//    若会被阻塞则停止并要求显式的再生产计划。
// 6. 终止性：business_goal / change_request 为源类型，任何参与者持有
//    produces 指向它们都是不良构声明（§3.1 约束 6）。
// 7. 组合性：与软件工程片段并行组合时，re_baseline 为共享接口类型；
//    下游片段不得声明与之不同的前置规则（C2），也不得生产它（C4）。
// =====================================================================
