# Research Record: RR-001 Embeddings

Status: approved
Owner: Knowledge & Retrieval Systems
Reviewed: 2026-07-11
Question: What minimal, source-backed facts support an embeddings section in the RAG foundations package?
Affected package: `pilot-program/03-publication-02.md`

## Sources

- OpenAI, [Embeddings API reference](https://platform.openai.com/docs/api-reference/embeddings/object).
- Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401).

## Supported claims

- An embedding endpoint returns a vector representation of input text; vector length depends on the selected model.
- The RAG paper describes a dense vector index as non-parametric memory accessed by a neural retriever.

## Excluded claims and limits

No source here establishes a universally best embedding model, dimension, distance metric, or chunking configuration. Those choices require context-specific evaluation.

## Integration

Create an embeddings glossary entry before publication; review when the selected implementation or source version changes.
