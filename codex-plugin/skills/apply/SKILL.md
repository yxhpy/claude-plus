---
name: apply
description: Apply the latest Codex diff to your working tree. Use when the user wants to apply changes from a previous Codex session.
---

# Apply Codex Changes

Apply the latest diff produced by Codex agent to your local working tree.

## What to do

1. Check the current git status to see the state of the working tree
2. Run `codex apply` (or `codex a`) to apply the latest changes
3. Show the user what was applied
4. Verify the changes were applied successfully

## Command

```bash
codex apply
```

Or use the short alias:

```bash
codex a
```

## Post-Application Steps

After applying:
1. Show `git status` to display what changed
2. Optionally show `git diff` to review the applied changes
3. Suggest next steps (review, test, commit)

Execute the command and guide the user through the applied changes.
