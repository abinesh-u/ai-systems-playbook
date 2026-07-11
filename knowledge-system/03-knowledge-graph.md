# Knowledge Graph

## Canonical dependency graph

```text
ML foundations
  → attention / transformer literacy
  → LLM and SLM behavior
  → agent workflows (state, routing, tools)
  → context engineering (memory, MCP, knowledge access)
  → retrieval systems (hybrid search, reranking, RBAC)
  → agent / RAG architecture (service boundaries, model placement)
  → production AI (evaluation, observability, reliability, cost)
  → intelligence systems (multi-agent coordination, governance)
```

## Relationship rules

| Relationship | From → to | Evidence / use |
| --- | --- | --- |
| prerequisite | LangGraph components → state management → multi-agent orchestration | 2024 LangGraph posts and 2026 roadmap |
| dependency | Context engineering → memory, MCP, RAG | `2026-03-10` explicitly connects these domains |
| dependency | Retrieval design → RAG service architecture | `2026-03-01` and `2026-03-05` |
| specialization | SLM-first architecture → phi-2 routing | `2026-02-25` → `2026-02-28` |
| implementation pattern | SLM routing + retrieval → microservice boundaries | `2026-02-28`, `2026-03-05` |
| operational requirement | Agent/RAG architecture → evaluation, observability, reliability | `2026-02-20`, `2026-06-09` |
| advanced extension | Production AI → systems of intelligence | `2026-06-25` |
| related practice | Agent orchestration → agentic engineering | `2026-06-25`, `2026-07-02` |

## Topic state

| State | Topics |
| --- | --- |
| Established in archive | LangGraph/state, SLM routing, hybrid RAG, microservices, context/memory/MCP, production checklist |
| Supporting prerequisites | LSTM/RNN, GAN, attention, systems thinking |
| Advanced | Fine-tuning routing SLMs, multi-agent coordination, distributed RAG, governance |
| Future (not yet source-backed) | embeddings/chunking, formal evaluation, guardrails, security, CI/CD, multimodal agents, agent testing |

Use “future” nodes only for planning. They are not claims that the archive covers those subjects.
