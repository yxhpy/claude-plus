---
description: Inspect and manage Codex feature flags for advanced capabilities
disable-model-invocation: false
---

# Codex Features

Inspect and manage feature flags to enable or disable experimental Codex capabilities.

## Usage

```
/codex:features [action]
```

## What to do

1. Execute `codex features` to list all available feature flags
2. Show current status of each feature
3. Provide guidance on enabling/disabling features

## Examples

### List All Features

```bash
# Show all feature flags and their status
codex features
```

### Enable Features

```bash
# Enable web search
codex --enable web-search

# Enable auto-commit
codex --enable auto-commit

# Enable multiple features
codex --enable web-search --enable auto-commit
```

### Disable Features

```bash
# Disable web search
codex --disable web-search

# Disable auto-commit
codex --disable auto-commit
```

## Common Feature Flags

### web-search
- **Description**: Enable web search for research and documentation lookup
- **Use Case**: Research best practices, find documentation, check latest updates
- **Example**: `codex --enable web-search exec "research React 19 features"`

### auto-commit
- **Description**: Automatically commit changes after successful execution
- **Use Case**: Streamline workflow for trusted operations
- **Example**: `codex --enable auto-commit exec "fix linting errors"`

### experimental-models
- **Description**: Access to experimental AI models
- **Use Case**: Test cutting-edge model capabilities
- **Example**: `codex --enable experimental-models -m o3`

### enhanced-security
- **Description**: Additional security checks and validations
- **Use Case**: High-security environments
- **Example**: `codex --enable enhanced-security`

### verbose-logging
- **Description**: Detailed logging for debugging
- **Use Case**: Troubleshooting and development
- **Example**: `codex --enable verbose-logging`

## Configuration File

Features can be permanently enabled in `~/.codex/config.toml`:

```toml
[features]
web-search = true
auto-commit = false
experimental-models = true
enhanced-security = true
verbose-logging = false
```

## Feature Management Strategies

### Development Environment

```toml
[features]
web-search = true
verbose-logging = true
experimental-models = true
auto-commit = false
```

### Production Environment

```toml
[features]
web-search = false
verbose-logging = false
experimental-models = false
enhanced-security = true
auto-commit = false
```

### CI/CD Pipeline

```toml
[features]
web-search = false
verbose-logging = true
auto-commit = true
enhanced-security = true
```

## Best Practices

1. **Test Features**: Enable experimental features in development first
2. **Document Usage**: Track which features are enabled for each project
3. **Security First**: Keep enhanced-security enabled in production
4. **Selective Enabling**: Only enable features you actively use
5. **Regular Review**: Periodically review and update feature flags

## Troubleshooting

### Feature Not Working

```bash
# Verify feature is enabled
codex features | grep <feature-name>

# Check configuration
cat ~/.codex/config.toml
```

### Conflicting Features

```bash
# Disable conflicting feature
codex --disable <feature-name>

# Reset to defaults
rm ~/.codex/config.toml
codex features
```

## Related Commands

- `/codex:exec` - Execute tasks with feature flags
- `/codex:quick-review` - Review with enhanced features
