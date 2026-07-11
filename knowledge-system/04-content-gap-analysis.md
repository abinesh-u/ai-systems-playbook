# Content Gap Analysis

The archive has strong architecture concepts but limited implementation evidence, measurement, and operational detail. Priority means importance to a complete AI Systems Engineering publication, not a commitment to publish.

| Priority | Gap | Why it matters | Existing bridge |
| --- | --- | --- | --- |
| P0 | RAG evaluation and retrieval metrics | Retrieval quality is central to the RAG cluster; no evaluation method is documented. | `2026-03-01`, `2026-03-05`, `2026-06-09` |
| P0 | LLM/agent observability | Tracing is named but instrumentation, data model, and diagnosis are absent. | `2026-06-05`, `2026-06-09` |
| P0 | Agent safety, tool permissions, and guardrails | MCP and tools create execution risk; the archive does not cover control design. | `2026-03-10`, `2026-06-09` |
| P0 | Retrieval foundations: embeddings, chunking, vector-store trade-offs | Current RAG material begins at architecture rather than data preparation. | `2026-03-01`, `2026-03-05` |
| P1 | Evaluation-driven delivery and regression testing | Production checklist calls for evals but not datasets, rubrics, or release gates. | `2026-06-09` |
| P1 | Agent testing and failure handling | State/orchestration needs deterministic tests, simulations, retries, and recovery. | LangGraph cluster |
| P1 | Deployment and CI/CD for AI systems | Service boundaries exist; release, versioning, secrets, and rollout processes do not. | `2026-02-20`, `2026-03-05` |
| P1 | Transformer and LLM foundations | Attention is covered, but the bridge to modern LLM mechanics is missing. | `2024-11-28` |
| P2 | Cost/latency engineering | Mentioned across SLM and production assets; needs measurement and decision framework. | `2026-02-25`, `2026-06-09` |
| P2 | Memory implementation patterns | Taxonomy exists; lifecycle, retrieval, consolidation, and privacy do not. | `2026-03-10` |
| P2 | Governance and multi-agent coordination | High-level systems-of-intelligence view needs concrete ownership and communication patterns. | `2026-06-25` |
| P3 | Multimodal agent systems | Useful scope expansion once core systems coverage is operationally complete. | No direct source bridge |

Project documentation for Athena, AegisAI, and Hermes is also a P0 evidence gap: the archive names them only as prior-conversation references and contains no technical facts to map.
