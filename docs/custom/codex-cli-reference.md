> ## Documentation Index
> Fetch the complete documentation index at: https://code.claude.com/docs/llms.txt
> Use this file to discover all available pages before exploring further.

# Codex CLI Reference

> Complete reference for the Codex command-line interface, including commands, flags, and usage patterns.

Codex is a powerful CLI tool that provides AI-powered coding assistance through both interactive and non-interactive modes. This reference covers all available commands and options.

## Quick Start

Start an interactive session:

```bash  theme={null}
codex
```

Run a one-time task:

```bash  theme={null}
codex "explain this project"
```

Execute non-interactively:

```bash  theme={null}
codex exec "add unit tests"
```

## CLI Commands

### Main Commands

| Command | Description | Example |
| :------ | :---------- | :------ |
| `codex` | Start interactive CLI (default) | `codex` |
| `codex [PROMPT]` | Start with initial prompt | `codex "fix the bug"` |
| `codex exec` | Run non-interactively (alias: `e`) | `codex exec "run tests"` |
| `codex review` | Run code review non-interactively | `codex review` |
| `codex login` | Manage authentication credentials | `codex login` |
| `codex logout` | Remove stored credentials | `codex logout` |
| `codex apply` | Apply latest diff to working tree (alias: `a`) | `codex apply` |
| `codex resume` | Resume previous interactive session | `codex resume` |
| `codex mcp` | [experimental] Manage MCP servers | `codex mcp` |
| `codex sandbox` | Run commands in sandbox (alias: `debug`) | `codex sandbox` |
| `codex cloud` | [experimental] Browse Codex Cloud tasks | `codex cloud` |
| `codex completion` | Generate shell completion scripts | `codex completion` |
| `codex features` | Inspect feature flags | `codex features` |

### Interactive vs Non-Interactive Modes

**Interactive Mode** (default):
- Start a REPL session with `codex` or `codex [PROMPT]`
- Conversational interface for iterative development
- Full access to all features and tools

**Non-Interactive Mode**:
- Use `codex exec` for one-time tasks
- Ideal for automation and CI/CD pipelines
- Returns results and exits

<Tip>
  Use interactive mode for exploratory work and debugging. Use `exec` mode for scripted tasks and automation.
</Tip>

## CLI Flags and Options

### Configuration Options

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `-c, --config <key=value>` | Override config value from `~/.codex/config.toml` | `-c model="o3"` |
| `-p, --profile <PROFILE>` | Use configuration profile | `-p production` |
| `-m, --model <MODEL>` | Specify model to use | `-m sonnet` |
| `--enable <FEATURE>` | Enable a feature flag | `--enable web-search` |
| `--disable <FEATURE>` | Disable a feature flag | `--disable auto-commit` |

<Note>
  Config values use dotted paths for nested values. The value is parsed as TOML, falling back to literal strings if parsing fails.
</Note>

### Model Selection

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `--oss` | Use local open source model provider | `--oss` |
| `--local-provider <PROVIDER>` | Specify local provider (lmstudio or ollama) | `--local-provider ollama` |

<Tip>
  The `--oss` flag verifies that a local LM Studio or Ollama server is running before starting.
</Tip>

### Sandbox and Security

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `-s, --sandbox <MODE>` | Set sandbox policy for shell commands | `-s read-only` |
| `-a, --ask-for-approval <POLICY>` | Configure approval requirements | `-a untrusted` |
| `--full-auto` | Low-friction sandboxed execution | `--full-auto` |
| `--dangerously-bypass-approvals-and-sandbox` | Skip all confirmations (DANGEROUS) | Use with extreme caution |

**Sandbox Modes:**
- `read-only`: Only read operations allowed
- `workspace-write`: Write access to workspace
- `danger-full-access`: Full system access (use with caution)

**Approval Policies:**
- `untrusted`: Only run trusted commands without approval
- `on-failure`: Ask for approval only if command fails
- `on-request`: Model decides when to ask
- `never`: Never ask for approval

<Warning>
  The `--dangerously-bypass-approvals-and-sandbox` flag is EXTREMELY DANGEROUS. Only use in externally sandboxed environments.
</Warning>

### Working Directory

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `-C, --cd <DIR>` | Set working directory | `-C /path/to/project` |
| `--add-dir <DIR>` | Add writable directories | `--add-dir ../shared` |

### Input and Output

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `-i, --image <FILE>` | Attach image(s) to initial prompt | `-i screenshot.png` |
| `--search` | Enable web search | `--search` |

### Version Information

| Flag | Description | Example |
| :--- | :---------- | :------ |
| `-h, --help` | Show help information | `--help` |
| `-V, --version` | Show version number | `--version` |

## Command Details

### codex exec

Run Codex non-interactively for one-time tasks. Ideal for automation and scripting.

```bash  theme={null}
codex exec [OPTIONS] [PROMPT]
```

**Examples:**

```bash  theme={null}
# Run tests
codex exec "run all unit tests"

# Generate documentation
codex exec "update README with API docs"

# Fix linting issues
codex exec "fix all eslint errors"
```

<Tip>
  Use `exec` in CI/CD pipelines to automate code reviews, testing, and documentation updates.
</Tip>

### codex review

Run a code review non-interactively. Analyzes code for quality, security, and best practices.

```bash  theme={null}
codex review [OPTIONS]
```

**Examples:**

```bash  theme={null}
# Review current changes
codex review

# Review with specific focus
codex review --config "focus=security"
```

### codex apply

Apply the latest diff produced by Codex agent as a `git apply` to your local working tree.

```bash  theme={null}
codex apply [OPTIONS]
```

**Alias:** `codex a`

**Examples:**

```bash  theme={null}
# Apply latest changes
codex apply

# Apply with alias
codex a
```

<Note>
  This command applies changes from the most recent Codex session to your working directory.
</Note>

### codex resume

Resume a previous interactive session. Shows a picker by default, or use `--last` to continue the most recent session.

```bash  theme={null}
codex resume [OPTIONS]
```

**Examples:**

```bash  theme={null}
# Show session picker
codex resume

# Resume most recent session
codex resume --last

# Resume specific session
codex resume <session-id>
```

### codex sandbox

Run commands within a Codex-provided sandbox environment. Useful for testing and debugging.

```bash  theme={null}
codex sandbox [COMMAND]
```

**Alias:** `codex debug`

**Examples:**

```bash  theme={null}
# Enter sandbox shell
codex sandbox

# Run command in sandbox
codex sandbox "npm test"
```

### codex mcp

[Experimental] Run Codex as an MCP server and manage MCP servers.

```bash  theme={null}
codex mcp [SUBCOMMAND]
```

<Note>
  MCP (Model Context Protocol) integration is experimental. See the [MCP documentation](/en/mcp) for details.
</Note>

### codex cloud

[Experimental] Browse tasks from Codex Cloud and apply changes locally.

```bash  theme={null}
codex cloud [OPTIONS]
```

### codex completion

Generate shell completion scripts for your shell (bash, zsh, fish, etc.).

```bash  theme={null}
codex completion [SHELL]
```

**Examples:**

```bash  theme={null}
# Generate bash completion
codex completion bash > ~/.codex-completion.bash

# Generate zsh completion
codex completion zsh > ~/.zsh/completions/_codex
```

### codex features

Inspect and manage feature flags.

```bash  theme={null}
codex features [OPTIONS]
```

## Common Workflows

### Quick Code Review

```bash  theme={null}
# Review current changes
codex review

# Review with custom config
codex -c "review.focus=security" review
```

### Automated Testing in CI/CD

```bash  theme={null}
# Run tests non-interactively
codex exec "run all tests and report failures"

# With specific sandbox settings
codex exec -s workspace-write "run integration tests"
```

### Local Model Usage

```bash  theme={null}
# Use Ollama
codex --oss --local-provider ollama

# Use LM Studio
codex --oss --local-provider lmstudio
```

### Safe Exploration

```bash  theme={null}
# Read-only sandbox for exploration
codex -s read-only "analyze the codebase structure"

# Full auto mode for trusted operations
codex --full-auto "update dependencies"
```

## Configuration File

Codex loads configuration from `~/.codex/config.toml`. You can override any setting using the `-c` flag.

**Example config.toml:**

```toml  theme={null}
model = "sonnet"
sandbox = "workspace-write"

[features]
web-search = true
auto-commit = false

[shell_environment_policy]
inherit = "all"
```

<Tip>
  Use profiles (`-p`) to maintain different configurations for different projects or environments.
</Tip>

## Best Practices

### Security

1. **Use appropriate sandbox modes**: Start with `read-only` for exploration
2. **Review approval policies**: Use `untrusted` or `on-request` for safety
3. **Never use bypass flags in production**: The `--dangerously-bypass-approvals-and-sandbox` flag should only be used in controlled environments

### Performance

1. **Use exec mode for automation**: Non-interactive mode is faster for scripted tasks
2. **Enable local models for offline work**: Use `--oss` with Ollama or LM Studio
3. **Resume sessions**: Use `codex resume` to continue previous work without losing context

### Workflow

1. **Start interactive for exploration**: Use `codex` to understand codebases
2. **Switch to exec for repetitive tasks**: Automate with `codex exec`
3. **Apply changes incrementally**: Use `codex apply` to review and apply diffs

## Troubleshooting

### Authentication Issues

```bash  theme={null}
# Re-authenticate
codex logout
codex login
```

### Model Not Available

```bash  theme={null}
# Check available models
codex features

# Use fallback model
codex -m haiku
```

### Sandbox Restrictions

```bash  theme={null}
# Increase sandbox permissions
codex -s workspace-write

# Debug sandbox issues
codex sandbox "echo test"
```

## See Also

* [Quickstart guide](/en/quickstart) - Getting started with Codex
* [MCP documentation](/en/mcp) - Model Context Protocol integration
* [Plugins](/en/plugins) - Extend Codex with custom functionality
* [Settings](/en/settings) - Detailed configuration options
* [Security](/en/security) - Security best practices and sandboxing
