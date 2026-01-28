# Codex Plugin Structure

This document explains the organization and purpose of each file in the Codex plugin.

## Directory Layout

```
codex-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest (required)
├── commands/                 # User-invoked commands
│   ├── apply.md             # Apply Codex diffs
│   ├── exec.md              # Execute tasks
│   ├── quick-review.md      # Quick code review
│   └── resume.md            # Resume sessions
├── skills/                   # Agent-invoked skills
│   ├── exec/
│   │   └── SKILL.md         # Execution skill
│   └── review/
│       └── SKILL.md         # Review skill
├── README.md                 # Main documentation
├── QUICKSTART.md            # Quick start guide
└── STRUCTURE.md             # This file

```

## File Purposes

### .claude-plugin/plugin.json

The plugin manifest that defines:
- Plugin name and version
- Description and metadata
- Author information
- Repository and homepage links

**Required fields:**
- `name`: Plugin identifier (used for namespacing)
- `description`: What the plugin does
- `version`: Semantic version number

### commands/

User-invoked commands that appear as `/codex:command-name` in Claude Code.

**apply.md**: Apply the latest Codex diff to working tree
- Usage: `/codex:apply`
- Runs: `codex apply` or `codex a`

**exec.md**: Execute Codex tasks non-interactively
- Usage: `/codex:exec <task>`
- Runs: `codex exec` with appropriate flags

**quick-review.md**: Fast code review on current changes
- Usage: `/codex:quick-review [focus]`
- Runs: `codex review` with optional focus area

**resume.md**: Resume previous Codex sessions
- Usage: `/codex:resume [session]`
- Runs: `codex resume` with session picker or ID

### skills/

Agent skills that Claude invokes automatically based on context.

**exec/SKILL.md**: Automated task execution skill
- Invoked when: Claude needs to run Codex non-interactively
- Provides: Safe execution with appropriate sandbox settings

**review/SKILL.md**: Code review skill
- Invoked when: Claude needs to perform code analysis
- Provides: Structured review with configurable focus areas

## Command vs Skill

### Commands (commands/)
- **User-invoked**: Called explicitly with `/codex:command-name`
- **Direct control**: User decides when to use them
- **Simple interface**: Often just execute a Codex command
- **Example**: `/codex:quick-review security`

### Skills (skills/)
- **Agent-invoked**: Claude decides when to use them
- **Automatic**: Triggered by conversation context
- **Intelligent**: Include decision-making logic
- **Example**: User asks "review my code" → Claude uses review skill

## Naming Conventions

### Plugin Name
- Defined in `plugin.json` as `"name": "codex"`
- Used for command namespacing: `/codex:command-name`

### Command Names
- File name becomes command name
- `quick-review.md` → `/codex:quick-review`
- Use kebab-case for multi-word names

### Skill Names
- Directory name becomes skill name
- `exec/` → skill named "exec"
- Defined in SKILL.md frontmatter

## Frontmatter Format

### Commands
```yaml
---
description: Brief description of what the command does
disable-model-invocation: false  # Allow Claude to process the command
---
```

### Skills
```yaml
---
name: skill-name
description: When and why Claude should use this skill
---
```

## Best Practices

### 1. Clear Descriptions
- Commands: User-facing, explain what it does
- Skills: Agent-facing, explain when to use it

### 2. Safety First
- Always specify appropriate sandbox modes
- Start with read-only for exploration
- Escalate to write access only when needed

### 3. Good Documentation
- Include examples in command files
- Explain parameters and options
- Show expected output

### 4. Consistent Naming
- Use descriptive names
- Follow kebab-case convention
- Keep names short but clear

## Extending the Plugin

### Add a New Command

1. Create `commands/new-command.md`
2. Add frontmatter with description
3. Write command instructions
4. Test with `claude --plugin-dir ./codex-plugin`

### Add a New Skill

1. Create `skills/new-skill/` directory
2. Add `SKILL.md` with skill definition
3. Include name and description in frontmatter
4. Write skill logic and guidelines

### Modify Existing Components

1. Edit the relevant `.md` file
2. Restart Claude Code to reload
3. Test the changes

## Plugin Loading

### Development
```bash
claude --plugin-dir ./codex-plugin
```

### Installation
```bash
cp -r codex-plugin ~/.claude/plugins/
```

### Marketplace
```bash
/plugin install codex
```

## Validation

Check plugin structure:
```bash
# Verify manifest exists
test -f codex-plugin/.claude-plugin/plugin.json && echo "✓ Manifest found"

# Verify JSON is valid
cat codex-plugin/.claude-plugin/plugin.json | python3 -m json.tool > /dev/null && echo "✓ Valid JSON"

# List commands
ls codex-plugin/commands/*.md

# List skills
find codex-plugin/skills -name "SKILL.md"
```

## Common Issues

### Commands Not Appearing
- Check file is in `commands/` directory
- Verify `.md` extension
- Ensure frontmatter is valid YAML
- Restart Claude Code

### Skills Not Working
- Check directory structure: `skills/skill-name/SKILL.md`
- Verify frontmatter includes name and description
- Ensure description clearly states when to use the skill

### Plugin Not Loading
- Verify `.claude-plugin/plugin.json` exists
- Check JSON syntax is valid
- Ensure `name` field is present
- Check file permissions

## References

- [Claude Code Plugin Documentation](https://code.claude.com/docs/plugins)
- [Skills Documentation](https://code.claude.com/docs/skills)
- [Codex CLI Reference](../../docs/custom/codex-cli-reference.md)
