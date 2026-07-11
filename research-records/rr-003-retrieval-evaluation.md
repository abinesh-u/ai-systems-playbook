# Research Record: RR-003 Retrieval evaluation

Status: approved
Owner: Knowledge & Retrieval Systems
Reviewed: 2026-07-11
Question: What supports evaluation guidance for hybrid retrieval and RAG?
Affected packages: `pilot-program/03-publication-02.md`, `pilot-program/04-publication-03.md`

## Sources

- Thakur et al., [BEIR](https://arxiv.org/abs/2104.08663).
- Ragas, [Available metrics](https://docs.ragas.io/en/stable/concepts/metrics/available_metrics/).

## Supported claims

- BEIR evaluates diverse lexical, sparse, dense, late-interaction, and reranking retrieval systems and reports robustness/performance trade-offs.
- Ragas documents retrieval-oriented metrics including context precision, context recall, noise sensitivity, response relevancy, and faithfulness.

## Excluded claims and limits

Benchmark and metric results are not transferable without a target dataset, task definition, and evaluation protocol. No tool is mandated.

## Integration

Create retrieval-metrics and evaluation-protocol references; require a target-dataset decision before publication guidance becomes prescriptive.
