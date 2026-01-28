---
description: Run commands in Codex sandbox environment for safe testing and debugging
disable-model-invocation: false
---

# Codex Sandbox

Run commands within a Codex-provided sandbox environment. Useful for testing, debugging, and safe command execution.

## Usage

```
/codex:sandbox [command]
```

## Arguments

- `[command]`: Optional command to run in sandbox (if omitted, enters interactive sandbox shell)

## What to do

1. Determine if user wants interactive shell or single command execution
2. Execute using `codex sandbox` or `codex debug` (alias)
3. Report results and any sandbox-specific behavior

## Examples

### Interactive Sandbox Shell

```bash
# Enter sandbox shell for exploration
codex sandbox
```

### Single Command Execution

```bash
# Test a command safely
codex sandbox "npm test"

# Debug script execution
codex sandbox "python script.py --debug"

# Verify environment
codex sandbox "env | grep PATH"
```

### Debugging Workflows

```bash
# Test build process
codex sandbox "npm run build"

# Verify dependencies
codex sandbox "pip list"

# Check file permissions
codex sandbox "ls -la"
```

## Use Cases

- **Safe Testing**: Test commands without affecting your system
- **Debugging**: Isolate and debug command execution issues
- **Environment Verification**: Check sandbox environment configuration
- **Command Validation**: Verify commands before running in production

## Safety Features

- Isolated execution environment
- No impact on host system
- Safe for testing potentially destructive commands
- Automatic cleanup after execution

## Tips

- Use sandbox to test commands before running with `codex exec`
- Verify environment variables and paths in sandbox
- Test build and deployment scripts safely
- Debug permission and access issues

## Related Commands

- `/codex:exec` - Execute tasks non-interactively
- `/codex:quick-review` - Review code changes
