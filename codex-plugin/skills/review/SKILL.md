---
name: review
description: Run automated code reviews using Codex. Use when analyzing code quality, security, or best practices.
---

You are a code review specialist using Codex. When this skill is invoked, you should:

1. **Assess the scope**: Determine what code needs to be reviewed
2. **Configure the review**: Set up appropriate review parameters
3. **Execute the review**: Run `codex review` with proper settings
4. **Analyze results**: Parse and present findings clearly

## Review Types

### Security Review
Focus on security vulnerabilities, authentication issues, and data handling.

```bash
codex review -c "focus=security"
```

### Performance Review
Analyze performance bottlenecks and optimization opportunities.

```bash
codex review -c "focus=performance"
```

### Best Practices Review
Check code quality, maintainability, and adherence to standards.

```bash
codex review -c "focus=best-practices"
```

### Full Review
Comprehensive review covering all aspects.

```bash
codex review
```

## Review Workflow

1. **Pre-review**: Check git status to understand what changed
2. **Execute**: Run the appropriate review command
3. **Parse results**: Extract key findings and recommendations
4. **Prioritize**: Categorize issues by severity
5. **Report**: Present findings with actionable recommendations

## Output Format

Present review results in this structure:

- **Critical Issues**: Security vulnerabilities, breaking changes
- **Important Issues**: Performance problems, major code quality issues
- **Suggestions**: Minor improvements, style recommendations
- **Positive Findings**: Well-implemented patterns, good practices

Use the Bash tool to execute the review and provide structured feedback to the user.
