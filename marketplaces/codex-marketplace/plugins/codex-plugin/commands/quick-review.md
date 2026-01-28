---
description: Intelligent code review using Codex with adaptive reasoning and focus areas
disable-model-invocation: false
---

# Codex Quick Review (Enhanced)

Run an intelligent code review on current changes using Codex with adaptive reasoning levels based on review complexity.

## Usage

```
/codex:quick-review [focus] [options]
```

## Arguments

- `focus` (optional): Focus area for the review
  - `security` - Security vulnerabilities and defensive programming
  - `performance` - Performance bottlenecks and optimization opportunities
  - `style` - Code style, best practices, and maintainability
  - `architecture` - System design and architectural patterns
  - `testing` - Test coverage and quality
  - `all` - Comprehensive review (default)

- `[options]`: Optional configuration flags
  - `--reasoning <level>` - Set reasoning effort (low/medium/high/xhigh)
  - `--depth <level>` - Review depth (quick/standard/thorough)

## What to do

### 1. Analyze Review Scope

Determine appropriate reasoning level based on review focus:

- **Security reviews**: Use `high` or `xhigh` reasoning for thorough vulnerability detection
- **Performance reviews**: Use `high` reasoning for complex optimization analysis
- **Style reviews**: Use `low` or `medium` reasoning for quick feedback
- **Architecture reviews**: Use `high` or `xhigh` reasoning for system-level analysis

### 2. Execute Review

Run `codex review` with appropriate configuration:

```bash
# Standard review (medium reasoning)
codex review

# Security-focused review (high reasoning)
codex review -c "reasoning.effort=high" -c "focus=security"

# Critical security audit (xhigh reasoning)
codex review -c "reasoning.effort=xhigh" -c "focus=security"

# Quick style check (low reasoning)
codex review -c "reasoning.effort=low" -c "focus=style"
```

### 3. Present Findings

Structure the output with:
- **Summary**: Overview of changes reviewed
- **Critical Issues**: High-priority problems requiring immediate attention
- **Warnings**: Medium-priority issues to address
- **Suggestions**: Improvements and best practices
- **Metrics**: Code quality indicators
- **Next Steps**: Recommended actions

## Examples

### Security Reviews

```bash
# Standard security review
codex review -c "focus=security"

# Deep security audit (for critical code)
codex review -c "reasoning.effort=xhigh" -c "focus=security"

# Quick security scan
codex review -c "reasoning.effort=medium" -c "focus=security"
```

### Performance Reviews

```bash
# Performance analysis
codex review -c "focus=performance"

# Deep performance optimization (complex algorithms)
codex review -c "reasoning.effort=high" -c "focus=performance"

# Quick performance check
codex review -c "reasoning.effort=medium" -c "focus=performance"
```

### Architecture Reviews

```bash
# System design review
codex review -c "focus=architecture"

# Comprehensive architectural analysis
codex review -c "reasoning.effort=xhigh" -c "focus=architecture"
```

### Style and Best Practices

```bash
# Quick style check
codex review -c "reasoning.effort=low" -c "focus=style"

# Comprehensive style and maintainability review
codex review -c "reasoning.effort=medium" -c "focus=style"
```

### Multi-Focus Reviews

```bash
# Security + Performance
codex review -c "focus=security,performance"

# Comprehensive review with high reasoning
codex review -c "reasoning.effort=high"
```

## Review Depth Levels

### Quick Review (Low Reasoning)
- **Duration**: 30 seconds - 2 minutes
- **Scope**: Surface-level issues, obvious bugs
- **Use Case**: Pre-commit checks, quick validation
- **Command**: `codex review -c "reasoning.effort=low"`

### Standard Review (Medium Reasoning)
- **Duration**: 2-5 minutes
- **Scope**: Common issues, best practices, moderate complexity
- **Use Case**: Daily development, PR reviews
- **Command**: `codex review` (default)

### Thorough Review (High Reasoning)
- **Duration**: 5-15 minutes
- **Scope**: Deep analysis, edge cases, complex logic
- **Use Case**: Critical features, complex algorithms
- **Command**: `codex review -c "reasoning.effort=high"`

### Critical Audit (xHigh Reasoning)
- **Duration**: 15+ minutes
- **Scope**: Exhaustive analysis, security hardening, system-level review
- **Use Case**: Production releases, security-critical code, financial systems
- **Command**: `codex review -c "reasoning.effort=xhigh"`

## Review Output Format

### Critical Issues (🔴)
- Security vulnerabilities
- Data loss risks
- Breaking changes
- Critical bugs

### Warnings (🟡)
- Performance issues
- Code smells
- Deprecated patterns
- Missing error handling

### Suggestions (🟢)
- Optimization opportunities
- Best practice improvements
- Refactoring recommendations
- Documentation enhancements

### Metrics (📊)
- Code complexity
- Test coverage
- Security score
- Performance indicators

## Best Practices

### Pre-Commit Workflow

```bash
# Quick check before commit
codex review -c "reasoning.effort=low"

# If issues found, run deeper review
codex review -c "reasoning.effort=medium"
```

### Pull Request Workflow

```bash
# Standard PR review
codex review -c "reasoning.effort=medium"

# For critical PRs
codex review -c "reasoning.effort=high"
```

### Release Workflow

```bash
# Comprehensive pre-release audit
codex review -c "reasoning.effort=xhigh" -c "focus=security,performance"
```

### Continuous Integration

```bash
# Automated review in CI/CD
codex review -c "reasoning.effort=medium" --output json > review-results.json
```

## Integration with Development Workflow

### 1. Development Phase
```bash
# Quick checks during development
codex review -c "reasoning.effort=low" -c "focus=style"
```

### 2. Testing Phase
```bash
# Standard review before testing
codex review -c "reasoning.effort=medium"
```

### 3. Pre-Production
```bash
# Thorough review before deployment
codex review -c "reasoning.effort=high" -c "focus=security,performance"
```

### 4. Production Release
```bash
# Critical audit for production code
codex review -c "reasoning.effort=xhigh"
```

## Troubleshooting

### Review Taking Too Long

```bash
# Reduce reasoning effort
codex review -c "reasoning.effort=medium"

# Focus on specific areas
codex review -c "focus=security"
```

### Too Many False Positives

```bash
# Increase reasoning for better accuracy
codex review -c "reasoning.effort=high"
```

### Missing Critical Issues

```bash
# Use xhigh reasoning for exhaustive analysis
codex review -c "reasoning.effort=xhigh"
```

## Related Commands

- `/codex:exec` - Execute fixes for review findings
- `/codex:apply` - Apply suggested changes
- `/codex:features` - Enable enhanced review features
