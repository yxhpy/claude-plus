---
description: Execute Codex tasks non-interactively with advanced model and sandbox configuration
disable-model-invocation: false
---

# Codex Execute (Enhanced)

Execute a Codex task non-interactively with intelligent model selection, reasoning optimization, and appropriate safety settings.

## Usage

```
/codex:exec [options] <task description>
```

## Arguments

- `task description`: The task you want Codex to execute
- `[options]`: Optional flags for model, reasoning, and sandbox configuration

## What to do

### 1. Analyze Task Complexity

Determine the appropriate reasoning effort level based on task complexity:

- **Simple tasks** (code completion, formatting, simple fixes): Use `low` reasoning
- **Standard tasks** (CRUD operations, unit tests, documentation): Use `medium` reasoning (default)
- **Complex tasks** (algorithms, bug diagnosis, architecture): Use `high` reasoning
- **Critical tasks** (large refactoring, security audits, system-level changes): Use `xhigh` reasoning

### 2. Select Appropriate Model

For GPT-5.2-Codex tasks, use the `-c` flag to configure reasoning effort:

```bash
# Low reasoning (fast, simple tasks)
codex exec -c "reasoning.effort=low" "<task>"

# Medium reasoning (balanced, default)
codex exec -c "reasoning.effort=medium" "<task>"

# High reasoning (complex logic)
codex exec -c "reasoning.effort=high" "<task>"

# xHigh reasoning (critical tasks)
codex exec -c "reasoning.effort=xhigh" "<task>"
```

### 3. Determine Sandbox Mode

**IMPORTANT**: Intelligently select sandbox mode based on task requirements:

- **workspace-write** (DEFAULT for development): File modifications, testing, documentation, refactoring, bug fixes, feature implementation
- **read-only**: Pure analysis, code review, exploration (no file changes)
- **danger-full-access**: System-level operations (use with extreme caution)

**Best Practice**: Default to `workspace-write` for most development tasks. Only use `read-only` when you're certain no file modifications are needed.

### 4. Execute with Optimal Configuration

Combine reasoning effort and sandbox mode for best results.

## Examples

### Simple Tasks (Low Reasoning)

```bash
# Code formatting
codex exec -c "reasoning.effort=low" -s read-only "format all Python files"

# Documentation generation
codex exec -c "reasoning.effort=low" -s workspace-write "generate API docs from comments"
```

### Standard Tasks (Medium Reasoning - Default)

```bash
# Run tests
codex exec -s workspace-write "run all unit tests and report failures"

# CRUD implementation
codex exec -s workspace-write "add CRUD endpoints for User model"
```

### Complex Tasks (High Reasoning)

```bash
# Algorithm implementation
codex exec -c "reasoning.effort=high" -s workspace-write "implement efficient graph traversal algorithm"

# Bug diagnosis
codex exec -c "reasoning.effort=high" -s read-only "diagnose race condition in concurrent code"

# Architecture analysis
codex exec -c "reasoning.effort=high" -s read-only "analyze and suggest improvements to module structure"
```

### Critical Tasks (xHigh Reasoning)

```bash
# Large-scale refactoring
codex exec -c "reasoning.effort=xhigh" -s workspace-write "refactor authentication system to use JWT"

# Security audit
codex exec -c "reasoning.effort=xhigh" -s read-only "perform comprehensive security audit for SQL injection vulnerabilities"

# System migration
codex exec -c "reasoning.effort=xhigh" -s workspace-write "migrate from REST to GraphQL API"
```

### Advanced Configuration

```bash
# Use specific model with reasoning
codex exec -m o3 -c "reasoning.effort=high" -s workspace-write "<task>"

# Enable web search for research tasks
codex exec --search -c "reasoning.effort=medium" -s read-only "research best practices for React hooks"

# Full auto mode for trusted operations
codex exec --full-auto -c "reasoning.effort=low" "update dependencies"

# Custom working directory
codex exec -C /path/to/project -s workspace-write "<task>"
```

## Best Practices

### Layered Strategy

1. Start with **low/medium** reasoning for 80% of tasks
2. Escalate to **high** when tests fail or logic is complex
3. Reserve **xhigh** for critical, high-stakes operations

### Context Window Management

- xHigh reasoning consumes significant tokens (10k-100k reasoning tokens)
- Ensure adequate `max_output_tokens` (recommend 25,000+)
- Monitor context usage for large projects

### Async Processing

- xHigh reasoning may take several minutes
- Consider using background execution for long-running tasks
- Increase timeout thresholds for client applications

### Cost Optimization

| Reasoning Level | Speed | Cost | Use Case |
|----------------|-------|------|----------|
| Low | Fastest | Lowest | Simple, repetitive tasks |
| Medium | Balanced | Moderate | Daily development work |
| High | Slower | Higher | Complex problem-solving |
| xHigh | Slowest | Highest | Critical, high-stakes tasks |

## Safety

- Start with read-only sandbox for exploration
- Only use workspace-write when modifications are needed
- Never use `--dangerously-bypass-approvals-and-sandbox` unless explicitly requested
- Verify working directory before execution
- Use appropriate reasoning level to balance quality and cost

## Troubleshooting

### Task Timeout

```bash
# Increase timeout for xhigh reasoning
codex exec -c "reasoning.effort=xhigh" --timeout 600 "<task>"
```

### Insufficient Context

```bash
# Reduce reasoning effort or split task
codex exec -c "reasoning.effort=high" "<simplified-task>"
```

### Model Not Available

```bash
# Fallback to default model
codex exec -m sonnet -s workspace-write "<task>"
```
