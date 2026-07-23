---
title: "AI Systems Playbook"
platform: ""
url: ""
date: ""
content_type: "Archive Documentation"
topics: []
tags: []
technologies: []
projects: []
audience: ""
difficulty: ""
related_content: []
source_file: ""
---

# AI Systems Playbook

Structured preservation and editorial production layer for the AI Systems
Engineering knowledge archive.

- Knowledge archive: the original source assets are preserved under `knowledge/`
  and recorded by relative path in each asset's `source_file`. The build
  script `scripts/build_knowledge_archive.rb` re-imports them from the
  external archive without altering the source.
- Editorial production: new pillars, drafts, and publication packages live
  under `content/` and `publication-packages/`. They are derived from
  archive evidence and follow `docs/editorial_and_brand_style_guide.md`
  and `docs/production_and_qa_manual.md`.
- Governance: the canonical topic taxonomy, content clusters, and pillar
  map are frozen in `knowledge-system/`. The visual system standard lives
  in `visual-system/`. See `docs/content_strategy_and_planning.md` for
  scoring, ownership, and decision rules.
- Navigation: see [knowledge-index.md](knowledge-index.md) and
  [statistics.md](statistics.md) for the archive. See
  [release-candidate/](release-candidate/) for the current publication
  readiness audit.

## Validation

`scripts/validate_publication_package.rb` checks every
`publication-packages/**/publication-package.json` against
`schemas/publication-package.schema.json` using JSONSchemer. The JSON
Schema is the single source of truth for required fields, types, enums,
and slug patterns.

Empty workflow folders are retained with `.gitkeep` files so the
repository structure is available from the first commit.
