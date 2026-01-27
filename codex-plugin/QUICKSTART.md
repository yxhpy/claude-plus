# Codex Plugin Quick Start

Get started with the Codex plugin for Claude Code in 5 minutes.

## Prerequisites

- Claude Code installed (version 1.0.33+)
- Codex CLI installed and authenticated
- Basic familiarity with Claude Code

## Step 1: Load the Plugin

Navigate to your project directory and load the plugin:

```bash
cd /path/to/your/project
claude --plugin-dir /path/to/codex-plugin
```

## Step 2: Verify Installation

Once Claude Code starts, check that the plugin loaded:

```bash
/help
```

You should see commands prefixed with `/codex:` in the list.

## Step 3: Try Your First Command

### Quick Code Review

Make some changes to your code, then run:

```bash
/codex:quick-review
```

Claude will use Codex to analyze your changes and provide feedback.

### Execute a Task

Try running an automated task:

```bash
/codex:exec analyze the project structure
```

## Step 4: Explore Agent Skills

The plugin includes agent skills that Claude invokes automatically. Try asking:

```
Can you review my code for security issues?
```

Claude may use the `review` skill to leverage Codex's capabilities.

## Common Use Cases

### 1. Automated Code Review

```bash
# Make changes
git add .

# Review with specific focus
/codex:quick-review security

# Or just ask Claude
"Review my changes for security vulnerabilities"
```

### 2. Non-Interactive Task Execution

```bash
# Run tests
/codex:exec run all unit tests

# Generate documentation
/codex:exec update the README with current features

# Analyze code quality
/codex:exec analyze code quality and suggest improvements
```

### 3. Session Management

```bash
# Resume last session
/codex:resume last

# Show session picker
/codex:resume

# Apply changes from previous session
/codex:apply
```

## Understanding Sandbox Modes

The plugin automatically chooses appropriate sandbox settings:

- **Read-only**: For analysis and exploration (safe)
- **Workspace-write**: For tasks that modify files (controlled)
- **Full-auto**: For trusted, automated workflows (convenient)

You don't need to worry about these - the plugin handles it intelligently.

## Tips for Best Results

### 1. Be Specific

Instead of:
```
/codex:exec fix bugs
```

Try:
```
/codex:exec fix the authentication bug where users can't log in with special characters
```

### 2. Use Focused Reviews

```bash
# For security audits
/codex:quick-review security

# For performance optimization
/codex:quick-review performance

# For code quality
/codex:quick-review style
```

### 3. Chain Commands

```bash
# Review, fix, and verify
/codex:quick-review
/codex:exec fix the issues found
/codex:exec run tests to verify fixes
```

## Troubleshooting

### Plugin Not Loading

**Problem**: Commands don't appear after loading plugin

**Solution**:
```bash
# Verify plugin structure
ls codex-plugin/.claude-plugin/plugin.json

# Check JSON is valid
cat codex-plugin/.claude-plugin/plugin.json
```

### Codex Command Not Found

**Problem**: "codex: command not found"

**Solution**:
```bash
# Install Codex
# (Follow Codex installation instructions)

# Verify installation
codex --version

# Check PATH
which codex
```

### Permission Errors

**Problem**: Codex can't write files

**Solution**: The plugin uses appropriate sandbox modes. If you need more permissions, you can manually run:

```bash
codex exec -s workspace-write "your task"
```

## Next Steps

### Customize for Your Workflow

1. **Add custom commands**: Create new `.md` files in `commands/`
2. **Add custom skills**: Create new skill directories in `skills/`
3. **Configure Codex**: Edit `~/.codex/config.toml`

### Integrate with CI/CD

Use the plugin in automated workflows:

```bash
# In your CI pipeline
claude --plugin-dir ./codex-plugin -p "run full test suite and report"
```

### Share with Your Team

1. Commit the plugin to your repository
2. Team members can load it with `--plugin-dir`
3. Or publish to a marketplace for easy installation

## Getting Help

- **Plugin Issues**: Check the README.md
- **Codex Issues**: Run `codex --help`
- **Claude Code Issues**: Type `/help` in Claude Code
- **Documentation**: See [Codex CLI Reference](../docs/codex-cli-reference.md)

## Example Session

Here's a complete workflow example:

```bash
# Start Claude Code with plugin
claude --plugin-dir ./codex-plugin

# Review current changes
/codex:quick-review

# Fix issues found
/codex:exec fix the linting errors

# Run tests
/codex:exec run unit tests

# Apply changes
/codex:apply

# Commit
git add .
git commit -m "Fix linting errors and add tests"
```

## What's Next?

- Explore all commands with `/help`
- Read the full [README](./README.md)
- Check out [Codex CLI Reference](../docs/codex-cli-reference.md)
- Customize the plugin for your needs

Happy coding! 🚀
