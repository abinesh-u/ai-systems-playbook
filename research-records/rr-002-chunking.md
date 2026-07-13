# Research Record: RR-002 Chunking and retrieval units

Status: approved
Owner: Knowledge & Retrieval Systems
Reviewed: 2026-07-11
Question: What evidence boundary governs chunking guidance in the RAG foundations package?
Affected package: `pilot-program/03-publication-02.md`

## Sources

- Lewis et al., [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401).
- Thakur et al., [BEIR: A Heterogeneous Benchmark for Zero-shot Evaluation of Information Retrieval Models](https://arxiv.org/abs/2104.08663).

## Supported claims

- Retrieval systems operate over indexed retrieval units/passages; retrieved context is an architectural input to generation.
- Retrieval performance must be evaluated across the target task/domain rather than assumed from a single setting.

## Excluded claims and limits

This record does not endorse a universal chunk size, overlap, parser, or segmentation algorithm. Pilot content must frame chunking as a decision to evaluate against corpus, query, and retrieval objectives.

## Integration

Create a chunking decision-framework reference page; re-review when a project corpus or benchmark is introduced.
