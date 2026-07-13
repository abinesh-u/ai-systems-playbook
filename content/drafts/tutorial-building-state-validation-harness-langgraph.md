---
title: "Building a State Validation Harness in LangGraph"
platform: "Personal Website"
url: "https://abinesh.blog/tutorials/langgraph-state-validation-harness"
date: "2026-07-13"
content_type: "Tutorial"
topics: ["Agent Systems", "LangGraph", "System Design"]
tags: ["LangGraph", "HarnessEngineering", "Python", "AgenticAI"]
technologies: ["LangGraph", "Pydantic", "Python"]
projects: []
audience: "AI Engineers, Developers (intermediate-advanced)"
difficulty: "Advanced"
related_content: ["content/pillar-pages/harness-engineering.md"]
source_file: "content/drafts/tutorial-building-state-validation-harness-langgraph.md"
---

# Building a State Validation Harness in LangGraph

This tutorial provides a step-by-step implementation guide for building a deterministic **State Validation Harness** around a LangGraph agent. 

For the theoretical framework and architectural principles of this pattern, see the parent publication: **[Harness Engineering: The Missing Reliability Layer in Agentic AI Systems](file:///Users/abi/Documents/ai-systems-playbook/content/pillar-pages/harness-engineering.md)**.

---

## 1. Prerequisites and Environment

To follow this tutorial, you need:
- **Python**: 3.10 or higher
- **Libraries**: `langgraph`, `pydantic` (v2), and `langchain-core`

Install the required packages:
```bash
pip install langgraph pydantic langchain-core
```

---

## 2. Target Architecture

In this tutorial, we will build a graph that intercepts proposals before they mutate the central state. The harness consists of:
1.  **Strict State Schema**: A Pydantic model enforcing type safety.
2.  **Validator Middleware**: A graph node that verifies state updates.
3.  **Self-Correction Route**: An edge that routes invalid calls back to the reasoning node with detailed error feedback.

```
       +------------------+
       |   Input State    |
       +--------+---------+
                |
                v
       +--------+---------+
       |  Agent Generator | <-----------------------+
       +--------+---------+                         | (Self-Correction)
                |                                   |
                v                                   |
       +--------+---------+                         |
   +---|  Harness Node    |---(State Invalid?)------+
   |   |  (Pydantic check)|
   |   +------------------+
   | (State Valid?)
   v
+--+---------------+
| Commit & Execute |
+------------------+
```

---

## 3. Step-by-Step Implementation

### Step 3.1: Define the Enforced State Schema
First, we define a strict state schema using Pydantic. If an agent tries to write arbitrary keys or malformed structures, the schema validation will catch it.

```python
from typing import List, Optional
from pydantic import BaseModel, Field, field_validator

# Define the data structure we want to validate
class CustomerProfile(BaseModel):
    customer_id: str = Field(..., min_length=5)
    credit_score: int = Field(..., ge=300, le=850)
    risk_level: str = Field("unknown")

    @field_validator("risk_level")
    @classmethod
    def validate_risk(cls, v: str) -> str:
        allowed = {"low", "medium", "high", "unknown"}
        if v not in allowed:
            raise ValueError(f"risk_level must be one of {allowed}")
        return v

# Define the central Graph State
class AgentState(BaseModel):
    customer_data: Optional[CustomerProfile] = None
    validation_errors: List[str] = Field(default_factory=list)
    iteration_count: int = Field(default=0)
    is_valid: bool = Field(default=True)
    next_step: str = Field(default="generate")
```

### Step 3.2: Create the Agent Node (The Probabilistic Core)
This node simulates our LLM generator. It proposes state updates. To demonstrate recovery, we will write it to propose an invalid state on the first run, and then correct it on the second run.

```python
def agent_reasoning_node(state: AgentState) -> dict:
    current_iter = state.iteration_count + 1
    
    # Simulate LLM output
    if current_iter == 1:
        # Proposed update: Invalid (risk_level is 'critical' which is not allowed)
        proposed_customer = {
            "customer_id": "cust-01",
            "credit_score": 720,
            "risk_level": "critical" # Schema error!
        }
    else:
        # Corrected update proposed after receiving validation error feedback
        proposed_customer = {
            "customer_id": "cust-10001",
            "credit_score": 720,
            "risk_level": "high" # Correct
        }
        
    return {
        "customer_data": proposed_customer,
        "iteration_count": current_iter,
        "validation_errors": [] # Clear old errors
    }
```

### Step 3.3: Implement the State Validation Harness Node
This node acts as our runtime safety wrapper. It intercepts the proposed state updates, parses them against our Pydantic model, and registers validation errors instead of letting the graph crash.

```python
from pydantic import ValidationError

def state_validation_harness(state: AgentState) -> dict:
    raw_data = state.customer_data
    
    if raw_data is None:
        return {"is_valid": False, "validation_errors": ["No customer data provided."]}
        
    try:
        # Perform strict validation
        if isinstance(raw_data, dict):
            validated_profile = CustomerProfile(**raw_data)
        else:
            validated_profile = CustomerProfile(**raw_data.model_dump())
            
        # If valid, pass it along
        return {
            "customer_data": validated_profile,
            "is_valid": True,
            "next_step": "commit"
        }
    except ValidationError as e:
        # Extract and format validation errors
        errors = [f"{err['loc'][0]}: {err['msg']}" for err in e.errors()]
        return {
            "is_valid": False,
            "validation_errors": errors,
            "next_step": "correct"
        }
```

### Step 3.4: Assemble the Graph and Define Routing
We assemble the graph and define a conditional routing edge based on the validation outcome.

```python
from langgraph.graph import StateGraph, START, END

# Initialize Graph
builder = StateGraph(AgentState)

# Add Nodes
builder.add_node("agent", agent_reasoning_node)
builder.add_node("validator", state_validation_harness)

# Define Core Flow
builder.add_edge(START, "agent")
builder.add_edge("agent", "validator")

# Define Routing Logic
def route_validator_outcome(state: AgentState) -> str:
    # Circuit breaker: stop if we cycle too many times
    if state.iteration_count >= 3:
        print("[Harness] Circuit breaker tripped: max iterations exceeded.")
        return END
        
    if state.is_valid:
        print("[Harness] State is valid. Committing execution.")
        return END
    else:
        print(f"[Harness] Validation failed: {state.validation_errors}. Routing back to Agent for correction.")
        return "agent"

# Add Conditional Edge
builder.add_conditional_edges(
    "validator",
    route_validator_outcome,
    {
        "agent": "agent",
        END: END
    }
)

# Compile the Graph
graph = builder.compile()
```

---

## 4. Verification and Execution

Run the compiled graph to verify the self-correction loop:

```python
if __name__ == "__main__":
    # Initialize blank state
    initial_state = AgentState()
    
    # Run the graph
    final_output = graph.invoke(initial_state)
    
    print("\n--- Final Graph State ---")
    print(f"Iterations: {final_output['iteration_count']}")
    print(f"Validation Valid: {final_output['is_valid']}")
    print(f"Final Data: {final_output['customer_data']}")
```

### Expected Output
When you execute the code above, the console should output:
```text
[Harness] Validation failed: ["risk_level: risk_level must be one of {'high', 'low', 'medium', 'unknown'}"]. Routing back to Agent for correction.
[Harness] State is valid. Committing execution.

--- Final Graph State ---
Iterations: 2
Validation Valid: True
Final Data: customer_id='cust-10001' credit_score=720 risk_level='high'
```

---

## 5. Recovery from Likely Failures

### 5.1 Runaway Correction Loops
*   **Problem**: The LLM keeps generating invalid updates, getting stuck in an infinite correction loop.
*   **Recovery**: Implement a hard circuit breaker inside the router (`route_validator_outcome`). In this tutorial, we tripped execution if `iteration_count >= 3`. In production, this threshold should trigger a graceful degradation callback or alert a human supervisor.

### 5.2 Dynamic Schema Changes
*   **Problem**: Upstream data formats change, causing the Pydantic parser to fail on previously valid data.
*   **Recovery**: Implement schema versioning in the validator harness. Parse incoming payloads using versioned schemas (e.g., `CustomerProfileV1`, `CustomerProfileV2`) based on a header flag.
