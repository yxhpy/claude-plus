---
name: exec-command
description: Execute a Codex task non-interactively. Use when the user wants to run a specific task using Codex.
---

# Codex Execute

Run a Codex task non-interactively with the provided prompt.

## Usage

The user provides a task description via `$ARGUMENTS`. Execute it using Codex in non-interactive mode.

## Task: $ARGUMENTS

## Execution Strategy

1. **Analyze the task**: Understand what needs to be done
2. **Choose sandbox mode**:
   - Use `read-only` for analysis and exploration
   - Use `workspace-write` for tasks that modify files
   - Use `full-auto` for trusted operations
3. **Execute**: Run the codex command
4. **Report**: Provide clear feedback on results

## Command Template

```bash
codex exec [OPTIONS] "$ARGUMENTS"
```

Choose appropriate options based on the task requirements:
- `-s read-only` for safe exploration
- `-s workspace-write` for file modifications
- `--full-auto` for automated workflows
- `-C <dir>` to specify working directory

Execute the command and present the results to the user.
