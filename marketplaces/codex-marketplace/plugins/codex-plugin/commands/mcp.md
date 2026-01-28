---
description: Manage and configure MCP (Model Context Protocol) servers for enhanced Codex capabilities
disable-model-invocation: false
---

# Codex MCP Management

[Experimental] Manage MCP (Model Context Protocol) servers to extend Codex with custom tools and integrations.

## Usage

```
/codex:mcp [subcommand]
```

## What to do

1. Determine the MCP operation requested (list, add, remove, configure)
2. Execute using `codex mcp` with appropriate subcommand
3. Provide clear feedback on MCP server status

## Subcommands

### List MCP Servers

```bash
# Show all configured MCP servers
codex mcp list
```

### Add MCP Server

```bash
# Add a new MCP server
codex mcp add <server-name> <server-config>
```

### Remove MCP Server

```bash
# Remove an MCP server
codex mcp remove <server-name>
```

### Run as MCP Server

```bash
# Run Codex as an MCP server
codex mcp serve
```

## Use Cases

### Custom Tool Integration

Extend Codex with custom tools and APIs:

```bash
# Add database query tool
codex mcp add db-tools ./mcp-servers/database.json

# Add cloud provider integration
codex mcp add aws-tools ./mcp-servers/aws.json
```

### Third-Party Services

Connect to external services:

```bash
# Add Jira integration
codex mcp add jira ./mcp-servers/jira-config.json

# Add Slack notifications
codex mcp add slack ./mcp-servers/slack-config.json
```

### Custom Workflows

Build specialized workflows:

```bash
# Add deployment automation
codex mcp add deploy-tools ./mcp-servers/deployment.json

# Add monitoring integration
codex mcp add monitoring ./mcp-servers/datadog.json
```

## MCP Server Configuration

Example MCP server configuration:

```json
{
  "name": "custom-tools",
  "version": "1.0.0",
  "tools": [
    {
      "name": "query-database",
      "description": "Query production database",
      "parameters": {
        "query": "string",
        "database": "string"
      }
    }
  ]
}
```

## Best Practices

- **Security**: Only add trusted MCP servers
- **Testing**: Test MCP servers in sandbox before production use
- **Documentation**: Document custom MCP server capabilities
- **Versioning**: Track MCP server versions for compatibility

## Safety Considerations

- MCP servers have access to Codex context
- Review MCP server code before installation
- Use read-only permissions when possible
- Monitor MCP server activity

## Troubleshooting

### Server Not Loading

```bash
# Verify server configuration
cat ./mcp-servers/config.json | jq

# Check Codex logs
codex mcp list --verbose
```

### Connection Issues

```bash
# Test server connectivity
codex mcp test <server-name>

# Restart MCP service
codex mcp restart
```

## Related Documentation

- [MCP Protocol Specification](https://modelcontextprotocol.io)
- [Codex MCP Integration Guide](/en/mcp)
- [Custom Tool Development](/en/plugins)

## Note

MCP integration is experimental and subject to change. Check official documentation for latest updates.
