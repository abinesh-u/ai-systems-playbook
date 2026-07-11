---
title: "Fine-Tuning phi-2 as a Fast Routing SLM for Agent Systems"
platform: "LinkedIn"
url: "https://www.linkedin.com/feed/update/urn:li:activity:7428649238554857472/"
date: "2026-02-28"
content_type: "Technical Architecture / Build Log"
topics: ["Fine-Tuning", "SLM Architecture", "Agent Routing", "Open Source AI"]
tags: ["AgenticAI", "SmallLanguageModels", "SLMArchitecture", "OpenSourceAI", "AIEngineering", "AIArchitecture"]
technologies: ["phi-2 (microsoft/phi-2, 2.7B parameters)", "Fine-tuning (end-to-end)", "Intent Classification", "Local inference", "Open source LLM"]
projects: ["SLM-First Enterprise RAG System", "Agent Routing Layer"]
audience: "ML engineers (advanced), AI engineers"
difficulty: "Advanced"
related_content: ["2026-02-25-slm-first-architecture.md", "2026-03-01-uber-enhanced-agentic-rag.md"]
source_file: "linkedin/2026-02-28-slm-fine-tuning-phi2-router.md"
---
Fine-Tuning a Fast Router SLM for Agent Systems

Most agent pipelines still route everything through a large, general-purpose LLM. Intent detection. Tool selection. Classification. Simple structured decisions.

I built a dedicated routing layer using 100% open source:
• Fine-tuned microsoft/phi-2 (2.7B) as Intent Classifier SLM
• ~30000+ agent-style intent examples
• End-to-end fine-tuned
• Runs locally (low latency, predictable output)

Architecture:
User Query
  → IntentClassifier SLM (phi-2)
  → Route to:
  ├── Search module
  ├── Summarization module
  ├── Tool execution layer
  ├── Classification handler
  └── Chat handler
  └── (Escalates to LLM only if needed)

Open source system benefits:
✅ Faster first response (local inference)
✅ Zero LLM dependency (60-80% fewer calls)
✅ No API costs - self-hosted
✅ Full control - no vendor lock-in
✅ Full observability of routing decisions

The shift I'm exploring:
Agentic systems shouldn't start with generalists.
They should start with specialists.

You don't need 70B parameters to decide "is this a search query?"
You need consistency.
Low latency.
Control.

SLM handles routing.
LLM handles reasoning.

That's where agent architecture is heading.

If you're building agent systems — are you still LLM-first?

#AgenticAI #SmallLanguageModels #SLMArchitecture #OpenSourceAI #AIEngineering #AIArchitecture
