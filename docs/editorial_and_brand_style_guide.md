# Editorial & Brand Style Guide

## Publication Constitution

### Authority

This is the highest editorial authority. It is subordinate only to factual evidence, legal/safety obligations, and the Architecture Freeze.

### Mission and vision

Make AI Systems Engineering understandable, verifiable, and operationally useful. Build a durable engineering handbook, not a trend publication.

### Audience and scope

Serve AI/ML, backend, platform engineers, and architects. Cover the frozen domains: foundations, agent systems, knowledge/retrieval, architecture, Production AI Systems, engineering practice, and the Reference Library.

### Standards

- Define AI Systems Engineering as the design, implementation, operation, and improvement of AI-enabled systems across models, data, tools, infrastructure, and people.
- Publish evidence-backed claims; label inference, recommendation, and uncertainty.
- Cite non-obvious technical claims and all external facts.
- Use diagrams to clarify boundaries, flows, decisions, and failure modes.
- Preserve editorial independence; no vendor, framework, or trend receives special treatment.
- Prefer durable mechanisms over novelty and quality over volume.

### Decisions and goals

Architecture before implementation; systems over tools; production over prototypes. Long-term success is a coherent, maintained body of technical knowledge—not output volume or audience metrics alone.

---

## Brand Positioning

### Position

AI Systems Playbook is an engineering documentation platform for reliable AI systems.

### For

- AI/ML engineers moving from experiments to production.
- Backend/platform engineers building agentic and retrieval systems.
- Architects making model, data, tool, and operations trade-offs.

### Differentiation and ownership

Own AI Systems Engineering: Agent Systems, Knowledge & Retrieval Systems, AI System Architecture, and Production AI Systems. Explain responsibilities, constraints, evidence, and operational consequences.

Avoid generic AI news, unsupported vendor rankings, motivational content as technical guidance, and trend-chasing. Desired reputation: precise, evidence-led, practical, and architecture-first.

---

## Editorial Principles

1. Architecture before implementation.
2. Systems over tools.
3. Teach reasoning, not recipes.
4. Production over prototypes.
5. Framework-agnostic unless a framework is the subject.
6. Prefer durable knowledge over trends.
7. Make trade-offs and failure modes explicit.
8. Use diagrams when they improve understanding.
9. Optimize for reader understanding, not word count.
10. Every page strengthens a pillar, hub, or Reference Library node.
11. Do not copy competitors or manufacture authority.
12. Reject hype, unsupported certainty, and false universals.

---

## Writing Style Guide

- Voice: precise, calm, direct, and technically literate.
- Sentence/paragraph style: active voice; one main idea per paragraph; short sentences for constraints and decisions.
- Headings name the reader question or system concern. Lists express steps, criteria, or alternatives.
- Define terms once and use them consistently with the taxonomy.
- State the outcome, context, mechanism, trade-offs, and failure modes.
- Use code only when executable or clearly marked pseudocode. Explain why it exists.
- Use analogies only to establish intuition; never as evidence or a replacement for mechanism.
- Target capable practitioners: explain unfamiliar concepts, do not dilute technical precision.

---

## Tone and Voice

| Attribute | Required behavior |
| --- | --- |
| Clear | Name assumptions and avoid implied leaps. |
| Respectful | Assume reader intelligence; define domain-specific terms. |
| Honest | State uncertainty, limitations, and source gaps. |
| Practical | Connect concepts to decisions and operational effects. |
| Independent | Avoid promotional language and vendor allegiance. |

Avoid urgency, fear, certainty without evidence, and “best” without stated criteria.

---

## Content Quality Standard

A page is publishable only when it has a defined audience, primary topic, pillar/hub or Reference Library home, evidence trail, accurate terminology, and distinct reader value.

Required technical qualities: correct boundaries, explicit assumptions, relevant trade-offs, failure modes where applicable, verified links/diagrams/code, and no unsupported project outcomes. A page must update an existing canonical page rather than duplicate it when its question is already answered.

---

## Article Anatomy

Required: title, reader outcome, scope, problem/context, mechanism or decision, trade-offs/failure modes, related links, and sources/evidence.

Optional: diagram, implementation notes, code, comparison, checklist, glossary callout, and next steps. Link upward to a pillar/hub and laterally to prerequisites and related pages. Review for technical accuracy, editorial clarity, SEO metadata, and architectural fit.

---

## Pillar Page Standard

Purpose: stable, comprehensive entry point for a frozen top-level domain. Required: domain map, scope/exclusions, core concepts, architecture decisions, operations considerations, learning order, child links, and sources.

Pillars change slowly and coordinate child pages; they do not duplicate them. Require a domain diagram, breadcrumbs, related hubs, and periodic freshness review. A hub is used when the collection is evolving rather than canonical.

---

## Tutorial Standard

Purpose: reproducible learning outcome. Required: audience, prerequisites, environment, target outcome, architecture overview, ordered steps, verification, failure recovery, and sources.

Mark conceptual steps and pseudocode. Link to the concept parent and a reference page. Require tested instructions or an explicit untested status; reject tutorials without a verifiable outcome.

---

## Case Study Standard

Purpose: document an evidenced engineering decision in context. Required: project boundary, constraints, problem, options, decision, architecture, implementation evidence, results, limitations, and reusable lessons.

Do not infer metrics, scale, ownership, or outcomes. Link to patterns and relevant pillars. Require a decision/architecture diagram when it clarifies the case; otherwise use a pattern note.

---

## Reference Page Standard

Reference pages include glossary entries, patterns, anti-patterns, comparisons, checklists, cheat sheets, research notes, and decision frameworks.

Required: stable definition or task, scope, source/version date, concise structure, related links, and maintenance owner. Patterns add context, forces, solution, trade-offs, and failure modes. Anti-patterns add symptoms, consequences, and safer alternatives. Comparisons state criteria before conclusions.

---

## Diagram Standard

Diagrams answer one engineering question. Name the question, label boundaries, inputs, outputs, ownership, and direction. Prefer editable source.

Use component diagrams for responsibilities, flow diagrams for execution, sequence diagrams for interactions, decision trees for choices, and comparisons for trade-offs. Verify every node/edge against cited evidence; omit decorative diagrams.

---

## Visual Language

- Flow: left-to-right; use top-to-bottom only for hierarchy.
- Layout: system boundary first, then services/components, then external dependencies.
- Color: semantic and restrained; never rely on color alone. Use one accent for emphasis and neutral tones for context.
- Icons: only familiar, licensed, and supplementary to labels.
- Typography: sentence case labels; consistent hierarchy; readable at normal article width.
- Naming: `domain-purpose-type` (for example, `rag-retrieval-flow`).

All diagrams must share these conventions and include a legend when symbols or colors encode meaning.

---

## SEO Guidelines

- One primary intent and canonical topic per page.
- Use stable, lowercase, hyphenated slugs; avoid dates unless the content is time-bound.
- Provide factual title, description, canonical URL, breadcrumbs, and appropriate structured data.
- Link to parent pillar/hub, prerequisites, and related pages with descriptive anchors.
- Use external links for evidence, not authority signaling.
- Include related-content blocks and refresh time-sensitive pages.
- Avoid keyword stuffing, duplicate intent pages, clickbait, and fabricated FAQs.

---

## Internal Linking Policy

Every publishable page links upward to its pillar/hub or Reference Library category, sideways to relevant peers, and downward to one useful next step where available.

Use descriptive anchors. Do not link merely for volume. Canonical pages own broad concepts; narrower pages link to them rather than restating them. Update incoming/outgoing links when pages are renamed, merged, deprecated, or materially revised.

---

## Citation Policy

Cite external facts, technical claims that are not common knowledge, quotations, data, benchmarks, diagrams derived from external work, and project evidence.

Prefer primary sources: specifications, papers, official documentation, and original project records. Cite near the claim with stable title and URL. Attribute adaptations. Do not cite a source that does not support the claim. Distinguish source evidence from editorial inference.

---

## Review Checklist

### Technical
- [ ] Claims, diagrams, code, sources, assumptions, and failure modes are accurate.
### Editorial
- [ ] Audience, outcome, scope, terminology, and structure are clear.
### Architecture and SEO
- [ ] Pillar/hub/library placement, internal links, title, metadata, and canonical intent are correct.
### Safety
- [ ] No secrets, private data, unsupported project claims, or harmful instructions remain.

---

## Publication Checklist

- [ ] Content-quality and review checks pass.
- [ ] Metadata, slug, sources, links, diagram source, and accessibility are complete.
- [ ] Pillar/hub/library navigation and related-content block are updated.
- [ ] Publication surface and canonical URL are recorded.
- [ ] Post-publication maintenance date and owner are assigned.

---

## Content Lifecycle

| Stage | Entry | Exit |
| --- | --- | --- |
| Idea | reader problem identified | scope decision recorded |
| Research | sources/evidence collected | archive record complete |
| Architecture | topic mapped | pillar/hub/library home approved |
| Draft | standard selected | required sections complete |
| Technical review | evidence ready | technical issues resolved |
| Editorial/SEO review | technical approval | clarity, metadata, links approved |
| Publication | checklist complete | canonical page released |
| Repurposing | canonical page stable | derivative surfaces linked |
| Maintenance/Archive | review due or obsolete | revised, deprecated, or archived |

---

## Versioning Policy

Use documentation semantic versions: `MAJOR.MINOR.PATCH`.

- MAJOR: changed scope, model, architecture, or reader contract.
- MINOR: new supported section, example, pattern, or material clarification.
- PATCH: correction, link repair, formatting, or non-substantive wording.

Record version/date for reference pages and material guides. Mark deprecated pages with successor, rationale, and review date; archive only when a page is obsolete and no longer safely maintainable.

---

## Repurposing Playbook

```text
Research → Knowledge Archive → Architecture mapping → Canonical website page
→ Medium adaptation / LinkedIn insight / newsletter curation
→ Reference or diagram update → internal-link and SEO refresh
```

The canonical page is the factual source. Derivatives select one supported angle, preserve attribution, link back where appropriate, and never introduce claims absent from the canonical evidence. Re-run review when adapting materially.

---

## Editorial Workflow

1. Classify the request against the Architecture Freeze and search existing canonical pages.
2. Reject work that is out of scope, unsupported, duplicative, unsafe, or lacks a reader outcome.
3. Merge overlapping requests into one canonical page; update an existing page when it already owns the question.
4. Recommend a pillar only for a stable top-level domain; recommend a hub for an evolving cluster.
5. Route definitions, patterns, comparisons, checklists, and research notes to the Reference Library.
6. Select the applicable standard, collect evidence, map links, draft, and run the lifecycle reviews.
7. Publish only after the checklists pass; schedule maintenance and deterministic repurposing.

The Editor-in-Chief records exceptions and escalates structural changes to architecture review.
