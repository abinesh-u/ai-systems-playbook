# Knowledge Graph

## Canonical layered graph

```text
Foundations
  → LLM / SLM behavior, retrieval fundamentals, systems literacy

Capabilities
  ├── Agent Systems: orchestration, state, context, memory, tools, routing
  └── Knowledge & Retrieval Systems: indexing, retrieval, reranking, access

Architecture
  → model placement, SLM-first design, service boundaries, inference design

Production AI Systems (cross-cutting from the first decision)
  → evaluation, observability, reliability, safety, cost, latency, deployment

Reference Library
  ↔ patterns, anti-patterns, checklists, comparisons, research notes
```

| Relationship | From → to | Evidence / use |
| --- | --- | --- |
| prerequisite | LangGraph components → state management → multi-agent orchestration | 2024 LangGraph posts and 2026 roadmap |
| dependency | Context engineering ↔ memory, MCP, RAG | `2026-03-10`; not a linear prerequisite to RAG |
| dependency | Retrieval design → RAG service architecture | `2026-03-01` and `2026-03-05` |
| specialization | SLM-first architecture → phi-2 routing | `2026-02-25` → `2026-02-28` |
| implementation pattern | SLM routing + retrieval → microservice boundaries | `2026-02-28`, `2026-03-05` |
| cross-cutting requirement | All capabilities and architecture ↔ evaluation, observability, reliability, safety, cost, latency | `2026-02-20`, `2026-06-09` |
| advanced extension | Agent Systems + Production AI Systems → intelligence systems | `2026-06-25` |

## Topic state

| State | Topics |
| --- | --- |
| Established | LangGraph/state, SLM routing, hybrid RAG, microservices, context/memory/MCP, Production AI Systems |
| Supporting prerequisites | LSTM/RNN, GAN, attention, systems thinking |
| Advanced | routing SLM fine-tuning, multi-agent coordination, distributed RAG, governance |
| Future | embeddings/chunking, formal evaluation, guardrails, security, CI/CD, multimodal agents, agent testing |

Future nodes are planning signals, not claims that the archive covers those subjects.
