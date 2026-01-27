#!/bin/bash

# Codex Plugin Validation Script
# This script validates the plugin structure and configuration

set -e

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERRORS=0
WARNINGS=0

echo "🔍 Validating Codex Plugin..."
echo "Plugin directory: $PLUGIN_DIR"
echo ""

# Color codes
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

error() {
    echo -e "${RED}✗ ERROR: $1${NC}"
    ((ERRORS++))
}

warning() {
    echo -e "${YELLOW}⚠ WARNING: $1${NC}"
    ((WARNINGS++))
}

success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Check plugin manifest
echo "📋 Checking plugin manifest..."
if [ -f "$PLUGIN_DIR/.claude-plugin/plugin.json" ]; then
    success "Plugin manifest exists"
    
    # Validate JSON
    if command -v python3 &> /dev/null; then
        if python3 -m json.tool "$PLUGIN_DIR/.claude-plugin/plugin.json" > /dev/null 2>&1; then
            success "Plugin manifest is valid JSON"
        else
            error "Plugin manifest is not valid JSON"
        fi
    else
        warning "Python3 not found, skipping JSON validation"
    fi
    
    # Check required fields
    if grep -q '"name"' "$PLUGIN_DIR/.claude-plugin/plugin.json"; then
        success "Plugin has 'name' field"
    else
        error "Plugin missing 'name' field"
    fi
    
    if grep -q '"description"' "$PLUGIN_DIR/.claude-plugin/plugin.json"; then
        success "Plugin has 'description' field"
    else
        error "Plugin missing 'description' field"
    fi
    
    if grep -q '"version"' "$PLUGIN_DIR/.claude-plugin/plugin.json"; then
        success "Plugin has 'version' field"
    else
        error "Plugin missing 'version' field"
    fi
else
    error "Plugin manifest not found at .claude-plugin/plugin.json"
fi

echo ""

# Check commands directory
echo "📁 Checking commands..."
if [ -d "$PLUGIN_DIR/commands" ]; then
    success "Commands directory exists"
    
    COMMAND_COUNT=$(find "$PLUGIN_DIR/commands" -name "*.md" -type f | wc -l)
    if [ "$COMMAND_COUNT" -gt 0 ]; then
        success "Found $COMMAND_COUNT command(s)"
        
        # List commands
        for cmd in "$PLUGIN_DIR/commands"/*.md; do
            if [ -f "$cmd" ]; then
                CMD_NAME=$(basename "$cmd" .md)
                echo "  - $CMD_NAME"
                
                # Check frontmatter
                if head -n 5 "$cmd" | grep -q "^---$"; then
                    success "  ✓ Has frontmatter"
                else
                    warning "  ⚠ Missing frontmatter"
                fi
            fi
        done
    else
        warning "No commands found"
    fi
else
    warning "Commands directory not found"
fi

echo ""

# Check skills directory
echo "🤖 Checking skills..."
if [ -d "$PLUGIN_DIR/skills" ]; then
    success "Skills directory exists"
    
    SKILL_COUNT=$(find "$PLUGIN_DIR/skills" -name "SKILL.md" -type f | wc -l)
    if [ "$SKILL_COUNT" -gt 0 ]; then
        success "Found $SKILL_COUNT skill(s)"
        
        # List skills
        for skill in "$PLUGIN_DIR/skills"/*/SKILL.md; do
            if [ -f "$skill" ]; then
                SKILL_NAME=$(basename "$(dirname "$skill")")
                echo "  - $SKILL_NAME"
                
                # Check frontmatter
                if head -n 5 "$skill" | grep -q "^---$"; then
                    success "  ✓ Has frontmatter"
                else
                    warning "  ⚠ Missing frontmatter"
                fi
                
                # Check for name field
                if grep -q "^name:" "$skill"; then
                    success "  ✓ Has 'name' field"
                else
                    warning "  ⚠ Missing 'name' field"
                fi
                
                # Check for description field
                if grep -q "^description:" "$skill"; then
                    success "  ✓ Has 'description' field"
                else
                    warning "  ⚠ Missing 'description' field"
                fi
            fi
        done
    else
        warning "No skills found"
    fi
else
    warning "Skills directory not found"
fi

echo ""

# Check documentation
echo "📚 Checking documentation..."
for doc in README.md QUICKSTART.md STRUCTURE.md SUMMARY.md; do
    if [ -f "$PLUGIN_DIR/$doc" ]; then
        success "$doc exists"
    else
        warning "$doc not found"
    fi
done

echo ""

# Check for common mistakes
echo "🔎 Checking for common mistakes..."

# Check if commands/skills are inside .claude-plugin (common mistake)
if [ -d "$PLUGIN_DIR/.claude-plugin/commands" ] || [ -d "$PLUGIN_DIR/.claude-plugin/skills" ]; then
    error "Commands or skills found inside .claude-plugin/ directory (should be at plugin root)"
else
    success "Commands and skills are at plugin root (correct)"
fi

# Check file permissions
if [ -r "$PLUGIN_DIR/.claude-plugin/plugin.json" ]; then
    success "Plugin manifest is readable"
else
    error "Plugin manifest is not readable"
fi

echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ Validation passed! Plugin is ready to use.${NC}"
    echo ""
    echo "To test the plugin:"
    echo "  claude --plugin-dir $PLUGIN_DIR"
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ Validation passed with $WARNINGS warning(s).${NC}"
    echo "Plugin should work, but consider addressing warnings."
else
    echo -e "${RED}✗ Validation failed with $ERRORS error(s) and $WARNINGS warning(s).${NC}"
    echo "Please fix errors before using the plugin."
    exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
