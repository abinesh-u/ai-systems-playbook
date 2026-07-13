# Content Strategy & Planning Guide

## Content Decision Engine

1. Normalize the request into topic, reader outcome, format, and evidence.
2. Locate its primary owner in `knowledge-system/01-topic-taxonomy.md`.
3. Search canonical pages, archive assets, hubs, and Reference Library records.
4. If equivalent: update; if substantial overlap: merge; if a missing angle: supporting page; if stable lookup: reference; if unsupported or out of scope: reject.
5. If novel, classify by rule: broad/stable domain → pillar; evolving cluster → hub; explanation → article; reproducible outcome → tutorial; evidenced project decision → case study; stable lookup → Reference Library type.
6. Score priority, map links and lifecycle inputs, then permit drafting.

No request bypasses steps 2–6.

---

## Topic Ownership

Every topic has exactly one primary owner; secondary relationships never change ownership.

| Primary owner | Owned topics | Typical support |
| --- | --- | --- |
| AI & LLM Foundations | model/LLM fundamentals | all technical pillars |
| Agent Systems | orchestration, state, memory, MCP, tools, routing | Knowledge & Retrieval; Production AI Systems |
| Knowledge & Retrieval Systems | RAG, retrieval, indexing, access | Agent Systems; Production AI Systems |
| AI System Architecture | model placement, services, inference | all capability pillars |
| Production AI Systems | evaluation, observability, reliability, safety, deployment | all pillars |
| Engineering Practice | systems thinking, workflows, professional practice | all pillars |
| Reference Library | definitions, patterns, comparisons, checklists, research | all pillars |

Example: Context Engineering is owned by Agent Systems; Knowledge & Retrieval and Production AI Systems are supporting relationships.

---

## Duplicate Detection

Compare requested content against canonical pages by reader outcome, primary topic, search intent, evidence, format, and diagram question.

| Match | Action |
| --- | --- |
| Same outcome and intent | Update existing page or reject duplicate |
| Same concept, distinct depth/audience | Expand supporting page |
| Complementary parts of one answer | Merge |
| Same tutorial result | Merge steps or archive superseded version |
| Same diagram question | Reuse/update diagram source |
| Overlapping keywords, different question | Cross-link; prevent cannibalization |
| Unsupported or redundant request | Reject |

Never rewrite archive assets. “Rewrite” applies only to a mutable drafted or published canonical page.

---

## Content Priority Engine

Score each candidate 0–5 for strategic importance (20%), topical authority (15%), SEO opportunity (10%), reader demand (10%), knowledge gap (15%), pillar support (10%), project relevance (5%), long-term value (10%), learning value (5%), then subtract maintenance cost (0–5 × 10%).

`Priority = weighted benefits − maintenance penalty`, normalized to 0–100.

| Score | Decision |
| --- | --- |
| 80–100 | Plan next |
| 60–79 | Queue in current quarter |
| 40–59 | Backlog; require trigger or evidence |
| <40 | Defer or reject |

Evidence gaps cap a case study at 39 until resolved.

---

## Pillar Expansion Engine

Maintain one roadmap per pillar. For each pillar, record current coverage, covered/missing leaves, hubs, tutorials, references, diagrams, projects, completeness %, and next three highest-priority gaps.

| Pillar | Current evidence | Immediate gap direction |
| --- | --- | --- |
| Agent Systems | LangGraph, context, multi-agent concepts | testing, safety, tool contracts |
| Knowledge & Retrieval Systems | EAg-RAG, hybrid retrieval, service boundaries | embeddings, chunking, retrieval evaluation |
| AI System Architecture | SLM-first, routing, microservices | decision frameworks, deployment evidence |
| Production AI Systems | systems thinking, checklist | observability, formal evaluation, releases |
| AI Systems Engineering | system framing | integrated lifecycle reference |

Completeness is `covered required leaves / defined required leaves`; it is a planning metric, not a quality claim.

---

## Reference Library Engine

Create a Reference Library page when the reader needs stable lookup rather than a sequential learning outcome.

| Need | Type |
| --- | --- |
| Term | Glossary |
| Reusable solution | Pattern |
| Recurring failure | Anti-pattern / failure mode |
| Choice under criteria | Decision framework / comparison |
| Operational verification | Checklist / cheat sheet |
| Cited external material | Research note |

Reference pages define, compare, or classify. Tutorials teach a reproducible sequence; link between them rather than duplicating either.

---

## Project Content Mapper

For each project—Athena, AegisAI, Hermes, or future—create a project record before content planning: owner, scope, dates, evidence, decisions, technologies, constraints, outcomes, privacy level, and related topics.

Map validated evidence to articles, tutorials, reference pages, case studies, diagrams, learning paths, and pillar/hub links. Flag missing relationships when a documented project has no decision record, case study candidate, architecture diagram, or applicable reference link.

Unverified project names remain placeholders; no technical relationship is inferred.

---

## Internal Link Engine

Every canonical page requires: primary owner, parent pillar/hub or library category, 1+ prerequisite, 1+ related peer where available, 1+ advanced follow-up where available, relevant project, learning path position, and Reference Library links.

Rules: link upward, sideways, and forward; use descriptive anchors; do not create orphan pages; do not link solely for volume. On rename, merge, deprecation, or major revision, repair incoming and outgoing links.

---

## SEO Decision Engine

| Condition | URL decision |
| --- | --- |
| Distinct intent and canonical topic | Create URL |
| Same intent; page can answer new need | Update URL |
| Two pages compete for same intent | Merge; redirect retired URL |
| Obsolete but historically useful | Deprecate with successor |
| Obsolete and unsafe/unmaintainable | Archive with explanation |

Before creation, compare primary query, reader outcome, headings, and links to prevent cannibalization. Canonical URLs, metadata, breadcrumbs, and related-content blocks follow editorial SEO guidelines.

---

## Publication Planner

At each planning cycle, inspect pillar gaps, score candidates, detect evidence readiness, and choose one next unit for each applicable queue: article, tutorial, reference, pillar update, diagram, and project case study.

Selection order: unblock prerequisites → close highest-value gap → strengthen a weak pillar → document validated project evidence → refresh stale canonical material. A request with no evidence cannot displace a higher-ready candidate.

---

## Quarterly Roadmap

Each quarter sets: target pillars, coverage delta, Reference Library additions, project documentation targets, technical-depth target, SEO intents, and highest-risk gaps.

Template:

| Quarter | Goals | Pillar/hub coverage | Reference/project work | KPI / review |
| --- | --- | --- | --- | --- |
| Q__ | 3–5 scored outcomes | leaves to add or deepen | patterns, projects, diagrams | completeness, freshness, orphan count |

Roll forward unfinished work only after rescoring against current evidence and maintenance load.

---

## Content Lifecycle Engine

`Idea → Research → Knowledge Archive → Architecture Review → Content Decision → Draft → Technical Review → Editorial Review → SEO Review → Publish → Repurpose → Maintain → Archive`

| Stage | Required input | Exit output |
| --- | --- | --- |
| Idea | reader problem | normalized request |
| Research/Archive | sources | evidence record |
| Architecture/Decision | topic map + overlap | approved type, owner, links, score |
| Draft/Reviews | applicable standard | approved canonical page |
| Publish/Repurpose | checklist | canonical URL and linked derivatives |
| Maintain/Archive | review signal | revision, deprecation, or archive record |

---

## Editor AI Playbook

When asked to “write an article,” first return a content decision record: primary owner, existing coverage, overlap action, priority score, supporting assets/evidence, project status, reference candidates, internal-link plan, SEO URL decision, and recommended format.

Draft only after the record permits it. Reject, merge, update, or route to the Reference Library when the rules require. Preserve source truth and log assumptions.

---

## Content Governance Rules

Reject weak ideas lacking audience, evidence, distinct outcome, or architectural fit. Merge duplicates; split oversized pages when they serve multiple independent intents. Create hubs only for an evolving cluster with multiple foreseeable pages. Update pillars when a child changes the domain map.

Taxonomy and graph changes require an ADR. Do not add top-level categories casually. Maintain canonical ownership, link integrity, and deprecation records to prevent drift.

---

## Decision Trees

### New content

```text
Idea → evidence? → no: research/reject
     → yes → existing canonical answer? → yes: update/merge/expand
                                      → no → stable broad domain? pillar
                                             evolving cluster? hub
                                             reproducible outcome? tutorial
                                             project decision evidence? case study
                                             lookup need? Reference Library
                                             otherwise: article
```

### SEO and project decisions

```text
Same search intent → update/merge/redirect; distinct intent → new URL
Project named → evidence complete? → yes: map case study/diagram/links
                                 → no: create evidence requirement only
```

---

## Scoring Models

| Model | Formula / use |
| --- | --- |
| Content priority | weighted 0–100 model in `04-content-priority-engine.md` |
| SEO value | intent clarity + gap + authority support + linkability − cannibalization risk |
| Technical depth | mechanism + trade-offs + failure modes + evidence + operational implications (0–5 each) |
| Knowledge completeness | covered required leaves / defined required leaves × 100 |
| Maintenance effort | freshness risk + dependency volatility + verification cost (0–5 each) |
| Publication readiness | evidence + standards + reviews + metadata/links + accessibility; all required gates pass |

Scores support decisions; they do not override safety, evidence, or Architecture Freeze constraints.
