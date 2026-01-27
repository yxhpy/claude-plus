# Codex Plugin for Claude Code

A comprehensive Claude Code plugin that integrates Codex CLI functionality, providing automated task execution, code reviews, and session management.

## Features

### Agent Skills

The plugin includes intelligent agent skills that Claude can invoke automatically:

- **exec**: Execute Codex tasks non-interactively with appropriate safety settings
- **review**: Run automated code reviews with configurable focus areas

### User Commands

Direct commands you can invoke with slash notation:

- `/codex:quick-review [focus]` - Run a fast code review on current changes
- `/codex:exec <task>` - Execute a Codex task non-interactively
- `/codex:resume [session]` - Resume a previous Codex session
- `/codex:apply` - Apply the latest Codex diff to your working tree

## Installation

### Option 1: Load for Single Session

```bash
claude --plugin-dir ./codex-plugin
```

### Option 2: Install Permanently

1. Copy the plugin to your Claude plugins directory:
   ```bash
   cp -r codex-plugin ~/.claude/plugins/
   ```

2. Restart Claude Code

### Option 3: Via Marketplace

If this plugin is published to a marketplace:

```bash
claude
/plugin install codex
```

## Usage

### Quick Code Review

```bash
# In Claude Code
/codex:quick-review

# With specific focus
/codex:quick-review security
/codex:quick-review performance
```

### Execute Tasks

```bash
# Run automated tests
/codex:exec run all unit tests

# Generate documentation
/codex:exec update API documentation

# Analyze code
/codex:exec analyze code quality
```

### Resume Sessions

```bash
# Show session picker
/codex:resume

# Resume last session
/codex:resume last

# Resume specific session
/codex:resume <session-id>
```

### Apply Changes

```bash
# Apply latest diff
/codex:apply
```

## Agent Skills Usage

Claude will automatically use these skills when appropriate:

**Automatic Code Review:**
When you ask Claude to review code, it may use the `review` skill to leverage Codex's review capabilities.

**Automated Execution:**
When you request automated task execution, Claude may use the `exec` skill to run Codex non-interactively.

## Configuration

The plugin respects Codex configuration from `~/.codex/config.toml`. You can override settings using the `-c` flag:

```bash
# Example: Use specific model
/codex:exec -c model="o3" analyze this code
```

## Safety Features

The plugin implements safety best practices:

- **Read-only by default**: Exploration tasks use read-only sandbox
- **Progressive permissions**: Only escalates to write access when needed
- **No dangerous bypasses**: Never uses unsafe flags unless explicitly requested
- **Clear feedback**: Always reports what actions were taken

## Examples

### Security Review Workflow

```bash
# Make some changes
git add .

# Run security-focused review
/codex:quick-review security

# Apply fixes if needed
/codex:exec fix security issues found in review
```

### Automated Testing

```bash
# Run tests non-interactively
/codex:exec run all tests and report failures

# If tests fail, debug
/codex:exec analyze test failures and suggest fixes
```

### Documentation Updates

```bash
# Generate docs
/codex:exec update README with current API

# Review the changes
/codex:quick-review

# Apply if good
/codex:apply
```

## Requirements

- Claude Code version 1.0.33 or later
- Codex CLI installed and configured
- Valid Codex authentication

## Troubleshooting

### Plugin Not Loading

```bash
# Verify plugin structure
ls -la codex-plugin/.claude-plugin/

# Check plugin.json is valid
cat codex-plugin/.claude-plugin/plugin.json | jq
```

### Commands Not Appearing

```bash
# Restart Claude Code
# Check available commands
/help
```

### Codex Not Found

```bash
# Verify Codex is installed
codex --version

# Check PATH
which codex
```

## Development

### Testing Locally

```bash
# Load plugin for testing
claude --plugin-dir ./codex-plugin

# Test commands
/codex:quick-review
/codex:exec echo test
```

### Adding New Commands

1. Create a new `.md` file in `commands/` directory
2. Add frontmatter with description
3. Write command instructions
4. Test with `--plugin-dir`

### Adding New Skills

1. Create a new directory in `skills/`
2. Add `SKILL.md` with skill definition
3. Include name and description in frontmatter
4. Test skill invocation

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Submit a pull request

## License

MIT License - see LICENSE file for details

## Support

- **Issues**: Report bugs on GitHub
- **Documentation**: See [Codex CLI Reference](./docs/codex-cli-reference.md)
- **Community**: Join the Claude Code Discord

## Changelog

### Version 1.0.0

- Initial release
- Agent skills: exec, review
- User commands: quick-review, exec, resume, apply
- Safety features and sandbox integration
- Comprehensive documentation
