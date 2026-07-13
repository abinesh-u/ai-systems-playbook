# Production & Quality Assurance Manual

## Production Pipeline

`Approved Topic → Research Assembly → Evidence Validation → Outline → Diagram Plan → Code Plan → Project Integration → Draft → Technical Review → Editorial Review → SEO Validation → Publication Package → Ready for Publishing`

| Stage | Entry | Exit |
| --- | --- | --- |
| Approved topic | CCIO decision record | owner, format, score, scope approved |
| Assembly/evidence | approved sources | evidence inventory and claim boundaries |
| Outline/plans | validated evidence | structural, diagram, code, project specifications |
| Draft/reviews | approved plans | all review gates pass |
| Package | approved canonical asset | complete publishing input |

No stage may be skipped or used to change topic ownership.

---

## Research Assembly Engine

Collect only approved material from the Knowledge Archive, knowledge-system, Reference Library, validated project records, research notes, canonical pages, hubs, and pillars.

Assembly output: source list, claims ledger, definitions, relevant links, project evidence status, known gaps, and citations. Separate source fact, editorial inference, and proposed guidance. Missing evidence blocks the affected claim; it never authorizes invention.

---

## Evidence Engine

For each asset, define required technical evidence, architecture evidence, examples, project references, diagrams, citations, and glossary links before drafting.

| Claim type | Minimum evidence |
| --- | --- |
| Technical mechanism | primary documentation, specification, paper, or validated implementation |
| Architecture decision | boundary/constraint evidence and trade-off record |
| Project outcome | documented project evidence only |
| Example | reproducible source or labelled conceptual pseudocode |

Reject unsupported claims, false precision, and project references without validated records.

---

## Outline Engine

Generate structure, not prose. Every outline states audience, outcome, scope/exclusions, primary owner, parent pillar/hub, prerequisites, related pages, Reference Library links, learning-path placement, and claim/evidence mapping.

| Type | Required structure |
| --- | --- |
| Article | context, mechanism/decision, trade-offs, links, sources |
| Tutorial | outcome, prerequisites, steps, verification, recovery |
| Case study | context, options, decision, evidence, limits, lessons |
| Reference | definition/criteria, concise structure, sources, maintenance |

Maximum scope: one reader outcome and one canonical intent; split otherwise.

---

## Article Composer

Purpose: create a canonical explanation or decision guide. Inputs: approved decision record, evidence ledger, outline, links, and metadata.

Required sections: outcome, scope, context, mechanism/decision, trade-offs/failure modes, related links, sources. Output: canonical Markdown plus publication package. Gates: evidence, architecture fit, editorial/SEO compliance, and review approval.

Pillar pages use `08-pillar-page-standard.md`; an article does not become a pillar by length.

---

## Tutorial Composer

Purpose: deliver one reproducible learning outcome. Inputs: validated environment, prerequisites, evidence, outcome, verification, and recovery plan.

Required: architecture overview, ordered steps, expected outputs, verification criteria, failure recovery, links, sources. Output: tested or explicitly untested tutorial package. Reject if outcome cannot be verified or code is unnecessary to the learning goal.

---

## Case Study Composer

Purpose: document an evidenced project decision. Inputs: validated project record, constraints, options, decision evidence, architecture, results, limitations.

Required: boundary, problem, options, decision, implementation evidence, outcomes, limitations, reusable lessons. Output: case-study package with privacy review. Athena, AegisAI, Hermes, and future projects are referenced only when their evidence record is complete.

---

## Reference Composer

Supports glossary, pattern, anti-pattern, architecture guide, decision framework, checklist, and comparison guide.

Inputs: stable lookup need, ownership, sources/version date, maintenance owner. Output: concise reference package with related tutorials/articles. Gates: no sequential tutorial duplication; comparison criteria precede conclusions; patterns include forces, trade-offs, and failure modes.

---

## Diagram Planning Engine

Plan a diagram when system boundaries, flow, interaction order, choices, lifecycle, comparison, conceptual model, or infrastructure cannot be explained efficiently in prose.

| Category | Purpose |
| --- | --- |
| System architecture / infrastructure | responsibilities and boundaries |
| Sequence / flow | interactions and execution |
| Decision tree | selection rules |
| Comparison | criteria and trade-offs |
| Lifecycle / conceptual | states or mental model |

Output: question, type, placement, complexity, nodes/edges, evidence, and `domain-purpose-type` name. No artwork is created here.

---

## Code Example Engine

Add code only when it validates or operationalizes the stated architecture. Select a framework appropriate to the approved scope; avoid incidental complexity and unbounded dependencies.

Specification requires purpose, environment, inputs/outputs, expected behavior, failure behavior, security constraints, explanation, and verification method. Code must be runnable, or explicitly identified as pseudocode. Do not use code as evidence for unsupported claims.

---

## Project Integration Engine

For every production asset, evaluate Athena, AegisAI, Hermes, and future projects: relevant validated evidence? If yes, add project link, decision record, privacy status, and case-study/diagram candidates. If no, record “not applicable: no validated relationship” and omit the project.

Project examples support the architecture; they never replace general evidence or imply unstated outcomes.

---

## Review Workflow

| Review | Pass/fail criteria |
| --- | --- |
| Technical | claims, code, diagrams, sources, boundaries, and failure modes verified |
| Architecture | ownership, graph, pillar/hub, and project relationships conform |
| Editorial | outcome, scope, clarity, terminology, and standard compliance pass |
| SEO | intent, URL action, metadata, links, breadcrumbs, and cannibalization pass |
| Publication readiness | package, accessibility, citations, and checklist complete |

Any failed gate returns the asset to revision; no reviewer may waive evidence requirements.

---

## Revision Engine

| Change | Workflow |
| --- | --- |
| Minor correction | verify, patch, PATCH version, log correction |
| Major update | reassemble evidence, rerun all reviews, MAJOR version |
| Expansion | test new intent against duplication rules; MINOR version |
| Merge/split | preserve redirects, links, history, and canonical ownership |
| Deprecation/archive | state reason, successor, date, and retained historical status |

All material revisions update sources, diagrams, metadata, links, and version history.

---

## Publication Package Engine

Required package: canonical Markdown, frontmatter, suggested slug/canonical URL, SEO metadata, internal links, external references, diagram plan/source, related articles, Reference Library links, project status, cross-platform adaptation notes, version, and completed publication checklist.

The package is the sole input to a publishing engine. Missing fields produce “not ready,” not an inferred default.

---

## Quality Assurance Engine

Evaluate pass/fail, not subjective scores:

- Technical accuracy: every material claim has valid evidence.
- Architectural consistency: ownership and links match frozen architecture.
- Editorial compliance: required standard sections and tone rules pass.
- Diagram/code completeness: every planned asset has source, evidence, and verification status.
- Reference completeness: citations and glossary/reference links are present where required.
- SEO/link completeness: intent, metadata, canonical URL, and required links pass.
- Publication readiness: every review gate and package field passes.

---

## Production Playbook

1. Accept only an approved CCIO decision record.
2. Assemble approved research and validate evidence.
3. Produce outline, diagram plan, code plan, and project integration decision.
4. Draft using the correct composer and editorial standard.
5. Run technical, architecture, editorial, SEO, and readiness reviews in order.
6. Apply revision workflow until all gates pass.
7. Assemble the publication package; hand off to publishing only when `Ready for Publishing`.

No production request bypasses governance, evidence, or review.
