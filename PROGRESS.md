# 需求工程技能 — 编译进度（换机续作用）

> 最后更新：2026-08-28（目录再次迁移 + 质量模块完成）
> 本文件是换机后恢复工作的入口。把本文件内容告诉助手即可续做。

## 一、环境与路径（2026-08-28 起）

| 内容 | 路径 |
|---|---|
| 技能工作目录（可写） | `D:\projects\skills\requirements-engineering` |
| 书籍资料目录（只读） | `D:\projects\skills\resources\ba&re\`（业务分析+需求工程资料） |
| 设计阶段资料（下一阶段技能用） | `D:\projects\skills\resources\design\`（C4、POSA 1-5、Richards & Ford、Hard Parts、Microservices 等） |
| PACT 规范 | `~/projects/pact/docs/pactv1_rev2.md`（当前版；`.pact` 文法以 rev2 §3.1 为准。同目录 `pactv1_rev1.md` 为历史版本，rev2 增加了"前置规则 LHS 类型两两相异"约束） |
| 已解析书籍全文缓存 | `D:\projects\skills\requirements-engineering\_parse_cache\`（9 份，见下） |

## 二、PDF 解析管线（已验证可用）

Read 工具读不了 PDF（"optional PDF not bundled"）。**必须用 file-read 技能**：

```
先加载 skill: file-read，然后（单行，不要换行续行）：
python "C:\Users\Ways\AppData\Local\Qianwen\User Data\qwen-agent\s4ouftsfop\skills\file-read\scripts\parse_file.py" "<PDF绝对路径>" -o "$env:TEMP\file-read\<name>.md" --skip-image-understanding
```

解析出的 md 很大（robertson 1.4MB / wiegers 1.7MB），**用 Grep 定位关键词行号再 Read 精确区间**，不要整文件读。
注意：新电脑上的技能脚本路径可能不同，若路径不存在，先 Glob 找 file-read 技能目录。

### _parse_cache 已有全文（换机不用再解析）

| 文件 | 源书 | 备注 |
|---|---|---|
| robertson.md | Mastering the Requirements Process 4th | Brown Cow 在 Ch.18（约 27283 行起），目录在 143/686 行 |
| wiegers.md | Software Requirements 3rd | Ch.11 质量属性在 ~13600-13800 行；Ch.29 追溯在 ~30519 行起；Ch.30 变更控制目录在 ~1571 行 |
| martinelli.md | Spec-Driven Development (Martinelli) | 已用于 specification-quality 模块 |
| jackson1.md / jackson2.md | Problem Frames 两篇 | 全文可直接用（篇幅小）；问题归约核心在 317-400 行，五框架在 547-650 行 |
| ears.md | EARS 论文 | 已编译完成，仅供参考 |
| torres.md / adzic.md / cockburn.md | Torres / Adzic / Cockburn | 2026-08-27 新解析，待编译为模块 |

## 三、✅ SPEC-7 问题已解决

结论：**"SPEC-7" 是杜撰的**（Martinelli 全书零命中）。已按决议处理：
- 新建 `methods/specification-quality.md` + `kb/specification-quality-patterns.yaml`（L1 双源逐字接地：Martinelli Ch.3/4/6 + Wiegers Ch.11）
- 旧的 `kb/spec7-patterns.yaml` 已改为 deprecated 重定向 stub
- SKILL.md §4.5 的引用已从 `spec7-quality.md` 改为 `specification-quality.md`

## 四、文件完成状态（2026-08-28 校准）

### 已完成 ✅
| 文件 | 接地级别 | 说明 |
|---|---|---|
| SKILL.md | — | HUB v3.1.0（§4.5 已修正引用） |
| README.md | — | 目录说明（状态矩阵需再刷新） |
| methods/ears-syntax.md | L1 逐字 | EARS 论文 |
| kb/ears-patterns.yaml | L1 逐字 | |
| validators/ears_regex.yaml | L1 | 含模糊词/实现泄漏词表（待拆分为独立文件） |
| methods/brown-cow.md | L1 逐字 | Robertson Ch.18 |
| kb/brown-cow-patterns.yaml | L1 逐字 | |
| methods/specification-quality.md | L1 逐字 | Martinelli Ch.3/4/6 + Wiegers Ch.11，替代杜撰的 SPEC-7 |
| kb/specification-quality-patterns.yaml | L1 逐字 | 含封闭词汇表 + 审查裁决词汇 |
| methods/problem-statement.md | L1 | Jackson 2005 两篇 + Jackson 2001 中文扫描版 §4.1.2-4.1.3（2026-09-01 经图像读取升级为 L1） |
| kb/problem-statement-patterns.yaml | L1 | 同上（2026-09-01 经中文扫描版图像读取升级） |
| methods/traceability.md | L1 逐字 | Wiegers Ch.29 全章 |
| kb/traceability-patterns.yaml | L1 逐字 | |
| methods/impact-analysis.md | L1 逐字 | Wiegers Ch.28（子任务编译，已抽查） |
| kb/impact-analysis-patterns.yaml | L1 逐字 | 同上 |
| methods/conflict-resolution.md | L1 逐字 | Wiegers Ch.2/5/6 + Volere Template V16 §2/§2f/§3d/§20a + Robertson 4th Ch.14（2026-09-01/02 全部升级为逐字接地） |
| kb/conflict-resolution-patterns.yaml | L1 逐字 | 同上；新增干系人冲突协议与 Conflicts 字段两个术语 |

### 待做 🔲（编译已全部完成，无待审核项）
全部接地升级已完成，技能中不再存在 L2/needs_review 条目：
- 2026-09-01：problem-statement.md §5.2 经 Jackson 2001 中文扫描版 §4.1.2-4.1.3 图像逐字读取升级为 L1
- 2026-09-01/02：conflict-resolution.md 的 Robertson/Volere 片段经 Volere Template V16 原文（§2 干系人冲突协议 / §2f 用户优先级 / §3d OTS 冲突 / §20a 环境冲突 / 需求模板 Conflicts 字段）核对升级为 L1
建议后续动作：拿一个真实小需求走一遍 S1→S5，检验门控与验证器联动。

### 已完成 ✅（2026-09-01 全量校准）
全部 41 个内容文件编译完成：
- HUB：SKILL.md v3.1.0
- 6 个阶段模块：s1~s6（s4 用 Volere ed.16 目录逐字接地；s6 用 Wiegers Ch.28 政策逐字接地）
- 10 个方法模块 + 10 个知识库（spec7 已废弃，由 specification-quality 替代）
- 3 个词表/正则验证器：ears_regex（词表已拆出）、ambiguous_words、implementation_leak_terms
- 6 个 JSON Schema（draft-07）：business_goal / raw_requirement / specification / validation_report / re_baseline / review_report
- 1 个 PACT 声明：pact/re_fragment.pact（rev2 重写；`pact analyze` 全绿 — 0 违规 0 警告 / 8 可达 0 不可达 / gate_coverage 0 / 死锁 0 / 滞留 0；`pact compose` 与软件工程三档片段组合均无冲突）
- _parse_cache：10 份书籍全文（含 2026-09-01 新增 volere.md）

## 五、编译规范（沿用 EARS 样板）

- 全英文编写（用户明确要求，中文仅最终渲染层）
- 每个模块三件套：`methods/<x>.md`（含 frontmatter：module/grounding/source/pdf_ref/page_refs）+ `kb/<x>-patterns.yaml` + 必要的 `validators/`
- grounding 分级：L1 verbatim（原文逐字+页码）> L2 structural（凭知识编译+用户审核）> L3 consensus（多源共识，标 needs_review）
- 粒度四问：有独立加载时机？有独立可验证输出？被≥2处引用？≤400行？不全过就内联或下沉
- 每个概念必须有 kb canonical 定义，封闭词汇表防术语漂移

## 六、历史要点速记（防再犯）

- PACT = Precondition-governed Autonomous Counter-based Token paradigm（Volkhover 论文，未发表），不是契约测试、不是 Prompt-Align-Critique-Transform。`business_goal` 是种子，需求工程是 PACT 内部子片段
- 用户批评过"实现泄漏"（按钮/HTTP/数据库混入需求），实现无关性是铁律
- 交付物在 `D:\projects\skills\requirements-engineering`，用户直接查看，不需要下载包
- 每本书引用要用资料目录里的**完整文件名**，不要只说作者+书名缩写
