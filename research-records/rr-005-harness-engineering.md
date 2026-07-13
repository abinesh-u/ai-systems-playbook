# Research Record: RR-005 Harness Engineering

Status: approved
Owner: AI System Architecture
Reviewed: 2026-07-13
Question: What evidence and architectural principles support the establishment of "Harness Engineering" as a reliability layer in Agentic AI?
Affected package: `publication-packages/harness-engineering.json`

## Sources

- LangGraph, [Conceptual Guides: Persistence and Checkpointing](https://langchainai.github.io/langgraph/concepts/persistence/)
- OpenAI, [OpenAI Agents SDK Documentation](https://github.com/openai/openai-agents-sdk) (focusing on structured outputs and runtime agent loops)
- CrewAI, [CrewAI Memory Systems and Flow Orchestration](https://docs.crewai.com/core-concepts/Memory/)
- Archive Assets:
  - [2026-03-05-slm-first-microservices-rag.md](file:///Users/abi/Documents/ai-systems-playbook/knowledge/linkedin/2026-03-05-slm-first-microservices-rag.md) (discusses operational domains, service boundaries, and routing)
  - [2026-03-10-context-engineering-memory-mcp.md](file:///Users/abi/Documents/ai-systems-playbook/knowledge/linkedin/2026-03-10-context-engineering-memory-mcp.md) (context engineering and memory boundaries)
- Industry trends (2026): The focus of enterprise Agentic AI has shifted from prompting to "harness engineering"—building runtime guardrails that handle state decay, schema drift, and tool execution failures.

## Supported claims

- **Limitation of Prompts**: Prompting alone cannot guarantee runtime execution safety or recover from network/API tool failures during long-horizon agent execution.
- **Agent Failure Modes**: Long-running agents fail due to cumulative state degradation (corrupted keys, type mismatches), context drift (noisy history filling context window), and schema misalignment (tools returning unexpected formats).
- **Core Harness Concept**: A runtime harness acts as a framework-agnostic interceptor pattern (middleware) that validates state transitions, enforces schema guards on tool calls, maintains context hygiene, and implements recovery policies (checkpoints, retries, and circuit breakers).

## Excluded claims and limits

This record does not prescribe a single orchestration library or mandate specific cloud provider infrastructure. Implementation details will vary depending on the chosen platform (LangGraph, OpenAI SDK, CrewAI), but the underlying architectural pattern remains invariant.

## Integration

- Establishes the foundations for the pillar article `harness-engineering.md`.
- Integrates with the [athena-ai](https://github.com/abinesh-u/athena-ai) and [agentic-patterns](https://github.com/abinesh-u/agentic-patterns) code examples for implementation patterns.
- Review date: 2026-10-13 (Quarterly review).
