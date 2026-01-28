# Codex Plugin Quick Start Guide

Get up and running with the enhanced Codex plugin in 5 minutes.

## Installation

### Quick Install (Recommended)

```bash
# Load plugin for current session
claude --plugin-dir ./marketplaces/codex-marketplace/plugins/codex-plugin
```

### Verify Installation

```bash
# In Claude Code, check available commands
/codex:<TAB>

# You should see:
# - /codex:quick-review
# - /codex:exec
# - /codex:sandbox
# - /codex:mcp
# - /codex:features
# - /codex:resume
# - /codex:apply
```

## 5-Minute Tutorial

### 1. Your First Task Execution (30 seconds)

```bash
# Simple task - plugin auto-selects low reasoning
/codex:exec format all Python files
```

**What happened:**
- Plugin analyzed task complexity (simple formatting)
- Selected `low` reasoning for fast execution
- Used `workspace-write` sandbox for file modifications
- Completed in ~10 seconds

### 2. Code Review (1 minute)

```bash
# Make some changes
echo "def hello(): print('world')" > test.py
git add test.py

# Run intelligent review
/codex:quick-review
```

**What happened:**
- Plugin analyzed change scope (1 file, few lines)
- Selected `low` reasoning for quick review
- Provided feedback on code quality
- Completed in ~30 seconds

### 3. Complex Task (2 minutes)

```bash
# Complex algorithm - plugin auto-selects high reasoning
/codex:exec implement a binary search tree with insert, delete, and search operations
```

**What happened:**
- Plugin detected complex algorithm task
- Selected `high` reasoning for deep analysis
- Used `workspace-write` sandbox
- Generated comprehensive implementation
- Completed in ~2 minutes

### 4. Security Review (2 minutes)

```bash
# Security-focused review - plugin auto-selects xhigh reasoning
/codex:quick-review security
```

**What happened:**
- Plugin detected security focus
- Selected `xhigh` reasoning for thorough analysis
- Checked for vulnerabilities (SQL injection, XSS, etc.)
- Provided detailed security report
- Completed in ~2 minutes

### 5. Sandbox Testing (30 seconds)

```bash
# Test command safely
/codex:sandbox npm test
```

**What happened:**
- Ran tests in isolated sandbox
- No impact on host system
- Reported test results
- Completed in ~30 seconds

## Common Workflows

### Daily Development

```bash
# 1. Implement feature (auto-optimized)
/codex:exec add user registration endpoint

# 2. Quick review
/codex:quick-review

# 3. Run tests
/codex:sandbox npm test

# 4. Apply changes
/codex:apply
```

### Bug Fixing

```bash
# 1. Analyze bug (medium reasoning)
/codex:exec analyze login bug

# 2. Fix with higher reasoning if needed
/codex:exec --reasoning high fix authentication edge cases

# 3. Review fix
/codex:quick-review security

# 4. Test
/codex:sandbox npm test
```

### Security Audit

```bash
# 1. Comprehensive security review (xhigh reasoning)
/codex:quick-review security --reasoning xhigh

# 2. Fix critical issues
/codex:exec fix security vulnerabilities

# 3. Re-review
/codex:quick-review security

# 4. Apply
/codex:apply
```

### Performance Optimization

```bash
# 1. Analyze performance
/codex:exec --reasoning high analyze database query performance

# 2. Review with performance focus
/codex:quick-review performance

# 3. Implement optimizations
/codex:exec optimize slow queries

# 4. Benchmark
/codex:sandbox npm run benchmark
```

## Understanding Automatic Optimization

### Task Complexity Detection

The plugin automatically selects reasoning levels:

| Your Task | Plugin Selects | Why |
|-----------|----------------|-----|
| "format code" | Low reasoning | Simple, repetitive |
| "add CRUD endpoint" | Medium reasoning | Standard development |
| "implement algorithm" | High reasoning | Complex logic |
| "audit security" | xHigh reasoning | Critical, high-stakes |

### Manual Override

Override automatic selection when needed:

```bash
# Force specific reasoning
/codex:exec --reasoning high <task>

# Use low for cost savings
/codex:exec --reasoning low <simple-task>

# Use xhigh for critical tasks
/codex:exec --reasoning xhigh <critical-task>
```

## Key Commands Cheat Sheet

### Task Execution
```bash
/codex:exec <task>                    # Auto-optimized execution
/codex:exec --reasoning low <task>    # Fast, cheap
/codex:exec --reasoning high <task>   # Deep analysis
/codex:exec --reasoning xhigh <task>  # Critical tasks
```

### Code Review
```bash
/codex:quick-review                   # Auto-depth review
/codex:quick-review security          # Security focus
/codex:quick-review performance       # Performance focus
/codex:quick-review --reasoning xhigh # Deep audit
```

### Sandbox & Testing
```bash
/codex:sandbox                        # Interactive sandbox
/codex:sandbox <command>              # Run command safely
```

### Session Management
```bash
/codex:resume                         # Show session picker
/codex:resume last                    # Resume last session
/codex:apply                          # Apply latest changes
```

### Advanced
```bash
/codex:features                       # List feature flags
/codex:mcp list                       # List MCP servers
```

## Tips for Success

### 1. Trust the Automation
- Let the plugin select reasoning levels
- It optimizes for cost and performance
- Override only when you have specific needs

### 2. Use Layered Strategy
- Start with auto-selected reasoning
- Escalate if results are insufficient
- Reserve xhigh for critical tasks

### 3. Focus Your Reviews
- Use specific focus areas (security, performance)
- Saves time and improves accuracy
- Combine focuses for comprehensive reviews

### 4. Test in Sandbox
- Always test commands in sandbox first
- Safe way to verify before production
- No impact on your system

### 5. Monitor Costs
- Check reasoning levels used
- Use lower levels for simple tasks
- Balance quality and cost

## Troubleshooting

### Plugin Not Working
```bash
# Verify installation
claude --plugin-dir ./marketplaces/codex-marketplace/plugins/codex-plugin

# Check Codex is installed
codex --version
```

### Tasks Taking Too Long
```bash
# Use lower reasoning
/codex:exec --reasoning medium <task>

# Or focus on specific areas
/codex:quick-review style
```

### High Costs
```bash
# Use layered approach
/codex:exec <task>  # Start with medium

# Only escalate if needed
/codex:exec --reasoning high <task>
```

## Next Steps

1. **Read Full Documentation**: See [README.md](README.md) for comprehensive guide
2. **Explore Advanced Features**: Try MCP servers and feature flags
3. **Customize Configuration**: Edit `~/.codex/config.toml`
4. **Join Community**: Get help and share experiences

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                    CODEX PLUGIN v2.0                        │
├─────────────────────────────────────────────────────────────┤
│ TASK EXECUTION                                              │
│  /codex:exec <task>              Auto-optimized execution   │
│  /codex:exec --reasoning <level> Manual reasoning control   │
│                                                             │
│ CODE REVIEW                                                 │
│  /codex:quick-review             Auto-depth review          │
│  /codex:quick-review <focus>     Focused review             │
│                                                             │
│ SANDBOX & TESTING                                           │
│  /codex:sandbox                  Interactive sandbox        │
│  /codex:sandbox <cmd>            Safe command execution     │
│                                                             │
│ SESSION MANAGEMENT                                          │
│  /codex:resume                   Resume session             │
│  /codex:apply                    Apply changes              │
│                                                             │
│ REASONING LEVELS                                            │
│  low    → Fast, cheap (simple tasks)                        │
│  medium → Balanced (daily work) [DEFAULT]                   │
│  high   → Deep analysis (complex tasks)                     │
│  xhigh  → Critical (high-stakes tasks)                      │
│                                                             │
│ REVIEW FOCUS                                                │
│  security, performance, style, architecture, testing, all   │
└─────────────────────────────────────────────────────────────┘
```

---

**Ready to go!** Start with `/codex:exec <your-task>` and let the plugin optimize everything for you.
