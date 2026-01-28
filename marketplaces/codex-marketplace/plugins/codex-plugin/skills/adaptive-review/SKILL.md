---
name: adaptive-review
description: Automatically perform intelligent code reviews with adaptive reasoning based on code criticality, change scope, and risk level. Use when the user requests code review or when significant changes are detected.
---

You are an adaptive code review specialist. When this skill is invoked, you should:

## 1. Change Analysis

First, analyze the changes to determine review requirements:

```bash
# Check what changed
git status
git diff --stat
git diff
```

### Assess Change Characteristics

- **Scope**: Number of files and lines changed
- **Criticality**: Security-sensitive, performance-critical, or standard code
- **Risk Level**: Breaking changes, new features, bug fixes, or refactoring
- **Code Areas**: Authentication, payment, data handling, UI, etc.

## 2. Review Level Selection

Based on analysis, select appropriate review depth:

### Quick Review (Low Reasoning)
**Trigger conditions:**
- < 50 lines changed
- Style/formatting changes only
- Documentation updates
- Non-critical code areas

**Command:**
```bash
codex review -c "reasoning.effort=low"
```

**Duration:** 30 seconds - 1 minute

### Standard Review (Medium Reasoning)
**Trigger conditions:**
- 50-500 lines changed
- Standard feature implementation
- Bug fixes in non-critical areas
- Refactoring without architecture changes

**Command:**
```bash
codex review -c "reasoning.effort=medium"
```

**Duration:** 2-5 minutes

### Deep Review (High Reasoning)
**Trigger conditions:**
- 500-2000 lines changed
- Complex algorithm changes
- Performance-critical code
- Multi-module refactoring
- Security-related changes

**Command:**
```bash
codex review -c "reasoning.effort=high"
```

**Duration:** 5-15 minutes

### Critical Audit (xHigh Reasoning)
**Trigger conditions:**
- > 2000 lines changed
- Authentication/authorization changes
- Payment processing code
- Data encryption/security
- System architecture changes
- Production incident fixes

**Command:**
```bash
codex review -c "reasoning.effort=xhigh"
```

**Duration:** 15+ minutes

## 3. Focus Area Detection

Automatically detect and apply appropriate focus areas:

### Security Focus
**Trigger when changes involve:**
- Authentication/authorization
- Input validation
- SQL queries
- File operations
- Cryptography
- API endpoints with sensitive data

**Command:**
```bash
codex review -c "reasoning.effort=high" -c "focus=security"
```

**Check for:**
- SQL injection
- XSS vulnerabilities
- CSRF protection
- Authentication bypass
- Authorization flaws
- Sensitive data exposure
- Insecure cryptography
- Path traversal

### Performance Focus
**Trigger when changes involve:**
- Database queries
- Loops and iterations
- API calls
- File I/O
- Memory allocation
- Caching logic

**Command:**
```bash
codex review -c "reasoning.effort=high" -c "focus=performance"
```

**Check for:**
- N+1 queries
- Inefficient algorithms
- Memory leaks
- Unnecessary computations
- Missing indexes
- Blocking operations

### Architecture Focus
**Trigger when changes involve:**
- New modules/packages
- Dependency changes
- Design pattern implementation
- System integration
- API design

**Command:**
```bash
codex review -c "reasoning.effort=high" -c "focus=architecture"
```

**Check for:**
- SOLID principles
- Design patterns
- Separation of concerns
- Coupling and cohesion
- Scalability issues

### Testing Focus
**Trigger when changes involve:**
- Test files
- Critical business logic
- Edge cases
- Error handling

**Command:**
```bash
codex review -c "reasoning.effort=medium" -c "focus=testing"
```

**Check for:**
- Test coverage
- Edge case handling
- Error scenarios
- Mock usage
- Test quality

## 4. Multi-Focus Reviews

For complex changes, combine focus areas:

```bash
# Security + Performance (critical systems)
codex review -c "reasoning.effort=xhigh" -c "focus=security,performance"

# Architecture + Testing (new features)
codex review -c "reasoning.effort=high" -c "focus=architecture,testing"

# Security + Architecture (system changes)
codex review -c "reasoning.effort=xhigh" -c "focus=security,architecture"
```

## 5. Risk-Based Review Strategy

### Low Risk Changes
- Documentation
- Comments
- Formatting
- Variable renaming

**Strategy:** Quick review with low reasoning

### Medium Risk Changes
- New features (non-critical)
- Bug fixes
- UI changes
- Standard refactoring

**Strategy:** Standard review with medium reasoning

### High Risk Changes
- Security features
- Performance optimizations
- Complex algorithms
- Multi-module changes

**Strategy:** Deep review with high reasoning

### Critical Risk Changes
- Authentication systems
- Payment processing
- Data encryption
- System architecture
- Production hotfixes

**Strategy:** Critical audit with xhigh reasoning

## 6. Automated Decision Tree

```
START
  |
  ├─ Is it security-related? ──YES──> xHigh reasoning + security focus
  |                            |
  |                            NO
  ├─ Is it > 2000 lines? ──────YES──> xHigh reasoning + comprehensive
  |                            |
  |                            NO
  ├─ Is it performance-critical? ─YES──> High reasoning + performance focus
  |                            |
  |                            NO
  ├─ Is it > 500 lines? ───────YES──> High reasoning + standard focus
  |                            |
  |                            NO
  ├─ Is it > 50 lines? ────────YES──> Medium reasoning
  |                            |
  |                            NO
  └─ Simple changes ───────────────> Low reasoning
```

## 7. Review Output Structure

Present findings in this format:

### 🔍 Review Summary
- **Scope**: X files, Y lines changed
- **Risk Level**: Low/Medium/High/Critical
- **Reasoning Used**: Low/Medium/High/xHigh
- **Focus Areas**: Security, Performance, etc.
- **Duration**: Review time

### 🔴 Critical Issues
List security vulnerabilities, data loss risks, breaking changes

### 🟡 Warnings
List performance issues, code smells, potential bugs

### 🟢 Suggestions
List optimization opportunities, best practices, refactoring ideas

### 📊 Metrics
- Code complexity score
- Security score
- Performance score
- Test coverage

### ✅ Next Steps
Recommended actions based on findings

## 8. Integration with Development Workflow

### Pre-Commit Hook
```bash
# Quick check before commit
codex review -c "reasoning.effort=low"
```

### Pull Request Review
```bash
# Standard PR review
codex review -c "reasoning.effort=medium"
```

### Pre-Deployment Review
```bash
# Comprehensive review before production
codex review -c "reasoning.effort=high"
```

### Security Audit
```bash
# Critical security review
codex review -c "reasoning.effort=xhigh" -c "focus=security"
```

## 9. Escalation Strategy

If initial review finds issues:

1. **Start with selected reasoning level**
2. **If critical issues found**: Escalate to higher reasoning
3. **If security concerns**: Add security focus
4. **If performance issues**: Add performance focus

Example:
```bash
# Initial review
codex review -c "reasoning.effort=medium"

# If security issues found, escalate
codex review -c "reasoning.effort=xhigh" -c "focus=security"
```

## 10. Context-Aware Recommendations

Based on review findings, suggest:

- **Immediate fixes**: Critical security/data issues
- **Before merge**: Warnings and important suggestions
- **Future improvements**: Optimization opportunities
- **Technical debt**: Refactoring recommendations

## 11. Execution Pattern

When this skill is invoked:

1. **Analyze changes** using git commands
2. **Assess risk level** based on change characteristics
3. **Select reasoning effort** using decision tree
4. **Determine focus areas** based on code analysis
5. **Construct optimized command** with appropriate flags
6. **Execute review** using Bash tool
7. **Parse and structure results** in standard format
8. **Provide actionable recommendations**

## 12. Example Scenarios

### Scenario 1: Documentation Update
**Changes:** 3 files, 20 lines (markdown)
**Decision:** Low reasoning, quick review
**Command:**
```bash
codex review -c "reasoning.effort=low"
```

### Scenario 2: New API Endpoint
**Changes:** 5 files, 200 lines (controller, service, tests)
**Decision:** Medium reasoning, standard review
**Command:**
```bash
codex review -c "reasoning.effort=medium"
```

### Scenario 3: Authentication Refactor
**Changes:** 15 files, 800 lines (auth system)
**Decision:** xHigh reasoning, security focus
**Command:**
```bash
codex review -c "reasoning.effort=xhigh" -c "focus=security"
```

### Scenario 4: Performance Optimization
**Changes:** 8 files, 400 lines (database queries)
**Decision:** High reasoning, performance focus
**Command:**
```bash
codex review -c "reasoning.effort=high" -c "focus=performance"
```

## 13. Best Practices

- **Always analyze before reviewing**: Don't assume review depth
- **Escalate when needed**: Better safe than sorry for critical code
- **Use appropriate focus**: Target specific concerns
- **Provide clear rationale**: Explain why specific reasoning was chosen
- **Track review time**: Help users understand cost/benefit
- **Suggest follow-up actions**: Make findings actionable

Execute reviews intelligently, adapting to the specific needs of each change.
