# Claude Code overview

> Learn about Claude Code, Anthropic's agentic coding tool that lives in your terminal and helps you turn ideas into code faster than ever before.

## Get started in 30 seconds

Prerequisites:

* A [Claude subscription](https://claude.com/pricing) (Pro, Max, Teams, or Enterprise) or [Claude Console](https://console.anthropic.com/) account

**Install Claude Code:**

To install Claude Code, use one of the following methods:

**macOS, Linux, WSL:**

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows PowerShell:**

```powershell
irm https://claude.ai/install.ps1 | iex
```

**Windows CMD:**

```batch
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

**Start using Claude Code:**

```bash
cd your-project
claude
```

You'll be prompted to log in on first use. That's it!

## What Claude Code does for you

* **Build features from descriptions**: Tell Claude what you want to build in plain English. It will make a plan, write the code, and ensure it works.
* **Debug and fix issues**: Describe a bug or paste an error message. Claude Code will analyze your codebase, identify the problem, and implement a fix.
* **Navigate any codebase**: Ask anything about your team's codebase, and get a thoughtful answer back. Claude Code maintains awareness of your entire project structure, can find up-to-date information from the web, and with MCP can pull from external data sources like Google Drive, Figma, and Slack.
* **Automate tedious tasks**: Fix fiddly lint issues, resolve merge conflicts, and write release notes. Do all this in a single command from your developer machines, or automatically in CI.

## Why developers love Claude Code

* **Works in your terminal**: Not another chat window. Not another IDE. Claude Code meets you where you already work, with the tools you already love.
* **Takes action**: Claude Code can directly edit files, run commands, and create commits. Need more? MCP lets Claude read your design docs in Google Drive, update your tickets in Jira, or use *your* custom developer tooling.
* **Unix philosophy**: Claude Code is composable and scriptable.
* **Enterprise-ready**: Use the Claude API, or host on AWS or GCP. Enterprise-grade security, privacy, and compliance is built-in.

## Use Claude Code everywhere

Claude Code works across your development environment: in your terminal, in your IDE, in the cloud, and in Slack.

* **Terminal (CLI)**: the core Claude Code experience. Run `claude` in any terminal to start coding.
* **Claude Code on the web**: use Claude Code from your browser at claude.ai/code or the Claude iOS app, with no local setup required.
* **Desktop app**: a standalone application with diff review, parallel sessions via git worktrees, and the ability to launch cloud sessions.
* **VS Code**: a native extension with inline diffs, @-mentions, and plan review.
* **JetBrains IDEs**: a plugin for IntelliJ IDEA, PyCharm, WebStorm, and other JetBrains IDEs with IDE diff viewing and context sharing.
* **GitHub Actions**: automate code review, issue triage, and other workflows in CI/CD with @claude mentions.
* **GitLab CI/CD**: event-driven automation for GitLab merge requests and issues.
* **Slack**: mention Claude in Slack to route coding tasks to Claude Code on the web and get PRs back.
* **Chrome**: connect Claude Code to your browser for live debugging, design verification, and web app testing.
