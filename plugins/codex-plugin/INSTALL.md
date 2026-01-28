# Installation Guide

Complete guide for installing and using the Codex plugin for Claude Code.

## Prerequisites

Before installing, ensure you have:

- ✅ **Claude Code** version 1.0.33 or later
  ```bash
  claude --version
  ```

- ✅ **Codex CLI** installed and working
  ```bash
  codex --version
  ```

- ✅ **Valid authentication** for both tools
  ```bash
  codex login
  claude login
  ```

## Installation Methods

### Method 1: Quick Test (Recommended for First Time)

Load the plugin temporarily to test it:

```bash
# Navigate to your project
cd /path/to/your/project

# Load the plugin
claude --plugin-dir /path/to/codex-plugin
```

**Pros:**
- Quick to test
- No permanent changes
- Easy to unload

**Cons:**
- Must specify path each time
- Not available in other projects

### Method 2: User Installation (Recommended for Regular Use)

Install permanently for your user account:

```bash
# Create plugins directory if it doesn't exist
mkdir -p ~/.claude/plugins

# Copy the plugin
cp -r /path/to/codex-plugin ~/.claude/plugins/

# Restart Claude Code
claude
```

**Pros:**
- Available in all projects
- Loads automatically
- Easy to update

**Cons:**
- Requires manual updates
- Affects all projects

### Method 3: Project Installation (Recommended for Teams)

Add the plugin to your project repository:

```bash
# Copy plugin to your project
cp -r /path/to/codex-plugin /path/to/your/project/

# Add to git
cd /path/to/your/project
git add codex-plugin
git commit -m "Add Codex plugin for Claude Code"

# Team members use it
claude --plugin-dir ./codex-plugin
```

**Pros:**
- Version controlled
- Team consistency
- Project-specific

**Cons:**
- Requires `--plugin-dir` flag
- Duplicated across projects

### Method 4: Marketplace (Future)

When published to a marketplace:

```bash
claude
/plugin install codex
```

## Verification

After installation, verify the plugin loaded correctly:

```bash
# Start Claude Code
claude

# Check available commands
/help

# You should see commands like:
# /codex:quick-review
# /codex:exec
# /codex:resume
# /codex:apply
```

## First Use

Try your first command:

```bash
# Quick code review
/codex:quick-review

# Or execute a task
/codex:exec analyze project structure

# Or just ask Claude
"Can you review my code for security issues?"
```

## Configuration

### Codex Configuration

The plugin uses your Codex configuration from `~/.codex/config.toml`:

```toml
# Example config
model = "sonnet"
sandbox = "workspace-write"

[features]
web-search = true
```

### Override Settings

Override settings per command:

```bash
# Use specific model
/codex:exec -c model="o3" analyze code

# Change sandbox mode
/codex:exec -s read-only explore codebase
```

## Updating

### User Installation

```bash
# Remove old version
rm -rf ~/.claude/plugins/codex-plugin

# Copy new version
cp -r /path/to/new/codex-plugin ~/.claude/plugins/

# Restart Claude Code
```

### Project Installation

```bash
# Pull latest changes
git pull

# Or update manually
cp -r /path/to/new/codex-plugin /path/to/your/project/
```

## Uninstallation

### User Installation

```bash
# Remove plugin
rm -rf ~/.claude/plugins/codex-plugin

# Restart Claude Code
```

### Project Installation

```bash
# Remove from project
rm -rf ./codex-plugin

# Remove from git
git rm -r codex-plugin
git commit -m "Remove Codex plugin"
```

## Troubleshooting

### Plugin Not Loading

**Problem:** Commands don't appear after installation

**Solutions:**

1. Verify plugin structure:
   ```bash
   ls -la ~/.claude/plugins/codex-plugin/.claude-plugin/plugin.json
   ```

2. Check JSON is valid:
   ```bash
   cat ~/.claude/plugins/codex-plugin/.claude-plugin/plugin.json | python3 -m json.tool
   ```

3. Restart Claude Code completely

4. Check Claude Code version:
   ```bash
   claude --version  # Should be 1.0.33+
   ```

### Commands Not Working

**Problem:** Commands appear but don't execute

**Solutions:**

1. Verify Codex is installed:
   ```bash
   which codex
   codex --version
   ```

2. Check Codex authentication:
   ```bash
   codex login
   ```

3. Test Codex directly:
   ```bash
   codex exec "echo test"
   ```

### Permission Errors

**Problem:** "Permission denied" errors

**Solutions:**

1. Check file permissions:
   ```bash
   chmod -R 755 ~/.claude/plugins/codex-plugin
   ```

2. Verify you own the files:
   ```bash
   ls -la ~/.claude/plugins/codex-plugin
   ```

### Validation Failed

**Problem:** Plugin validation fails

**Solutions:**

1. Run validation script:
   ```bash
   cd /path/to/codex-plugin
   ./validate.sh
   ```

2. Fix reported errors

3. Reinstall plugin

## Advanced Configuration

### Custom Plugin Location

```bash
# Set custom plugin directory
export CLAUDE_PLUGINS_DIR=/custom/path
claude
```

### Multiple Plugins

```bash
# Load multiple plugins
claude --plugin-dir ./codex-plugin --plugin-dir ./other-plugin
```

### Profile-Based Loading

Create a Claude Code profile that loads the plugin:

```toml
# ~/.claude/config.toml
[profiles.codex]
plugin_dirs = ["/path/to/codex-plugin"]
```

Use it:
```bash
claude -p codex
```

## Getting Help

### Plugin Issues

1. Check documentation:
   - `README.md` - Complete guide
   - `QUICKSTART.md` - Quick start
   - `STRUCTURE.md` - Architecture
   - `SUMMARY.md` - Overview

2. Run validation:
   ```bash
   ./validate.sh
   ```

3. Check logs:
   ```bash
   claude --debug
   ```

### Codex Issues

```bash
# Codex help
codex --help

# Specific command help
codex exec --help
```

### Claude Code Issues

```bash
# In Claude Code
/help

# Or ask
"How do I use plugins?"
```

## Best Practices

### 1. Start with Quick Test

Always test with `--plugin-dir` before permanent installation:

```bash
claude --plugin-dir ./codex-plugin
```

### 2. Keep Updated

Regularly update the plugin for new features and fixes.

### 3. Use Validation

Run validation after updates:

```bash
./validate.sh
```

### 4. Document Custom Changes

If you modify the plugin, document your changes.

### 5. Share with Team

For team projects, commit the plugin to your repository.

## Next Steps

After installation:

1. **Read** `QUICKSTART.md` for a 5-minute tutorial
2. **Try** the example workflows in `README.md`
3. **Explore** all commands with `/help`
4. **Customize** by adding your own commands/skills

## Support

- **Documentation**: Check the docs in the plugin directory
- **Issues**: Report problems on GitHub
- **Community**: Join Claude Code Discord
- **Updates**: Watch the repository for new releases

---

**Ready to start? Run:**

```bash
claude --plugin-dir /path/to/codex-plugin
/codex:quick-review
```

**Happy coding! 🚀**
