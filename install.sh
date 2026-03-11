#!/bin/bash
# Agentlify Qwen Agents Course — Install Script
# Usage: curl -sL https://raw.githubusercontent.com/Agentlify/qwen-course/main/install.sh | bash
# Or: bash install.sh (if downloaded locally)

set -e

echo ""
echo "========================================"
echo "  Agentlify Qwen Agents Course Setup"
echo "========================================"
echo ""

# Define paths
QWEN_DIR="$HOME/.qwen"
COURSE_DIR="$QWEN_DIR/commands/agentlify"
GIFTS_DIR="$QWEN_DIR/gifts"

# Detect if running from pipe (curl) or local
if [ -t 0 ] && [ -f "$(dirname "$0")/lesson-1.md" ]; then
    SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
    INSTALL_MODE="local"
else
    INSTALL_MODE="remote"
    REPO_URL="https://raw.githubusercontent.com/Agentlify/qwen-course/main"
fi

# Create directories
echo "[1/4] Creating directories..."

mkdir -p "$COURSE_DIR"
echo "  Created: $COURSE_DIR"

mkdir -p "$GIFTS_DIR"
echo "  Created: $GIFTS_DIR"

# Course files to install
FILES="welcome.md lesson-1.md lesson-2.md lesson-3.md lesson-4.md"

echo ""
echo "[2/4] Downloading course files..."

if [ "$INSTALL_MODE" = "local" ]; then
    for file in $FILES; do
        if [ -f "$SOURCE_DIR/$file" ]; then
            cp "$SOURCE_DIR/$file" "$COURSE_DIR/$file"
            echo "  Copied: $file"
        else
            echo "  Missing: $file (skipped)"
        fi
    done
else
    for file in $FILES; do
        if curl -sL --fail "$REPO_URL/$file" -o "$COURSE_DIR/$file" 2>/dev/null; then
            echo "  Downloaded: $file"
        else
            echo "  Failed: $file (skipped)"
        fi
    done
fi

# Create gift file — 30 AI Prompts for Coaches
echo ""
echo "[3/4] Creating gift files..."

cat > "$GIFTS_DIR/30-ai-prompts-for-coaches.md" << 'GIFT_EOF'
# 30 AI Prompts for Coaches

Copy any prompt. Paste into Qwen Code. Get personalized results.

## Content Creation (1-10)

1. "Give me 5 content ideas for this week based on my ideal client's pain points"
2. "Write an Instagram post about [topic] in my voice"
3. "Create a week's worth of LinkedIn posts that build toward my offer"
4. "Turn this one idea into: tweet, Instagram caption, and email subject line"
5. "What are 10 questions my ideal clients are asking Google right now?"
6. "Write a blog post outline about [topic] that shows my expertise"
7. "Give me 5 client success story angles I could share (anonymized)"
8. "Create a content calendar for the next 2 weeks"
9. "What's a contrarian take I could share that would get attention?"
10. "Write a 'behind the scenes' post that builds trust"

## Client Communication (11-18)

11. "Draft a welcome email for new coaching clients"
12. "Write a check-in message for mid-programme clients"
13. "Create a testimonial request email that doesn't feel awkward"
14. "Draft a 'I haven't heard from you' nudge that's not annoying"
15. "Write an email to a client who's stuck"
16. "Create a programme completion message with next steps"
17. "Draft a 'I have a spot opening' message for my waitlist"
18. "Write a re-engagement email for past clients"

## Strategy & Planning (19-24)

19. "Audit my current offer and tell me what's missing"
20. "What should I charge for [service] based on my experience level?"
21. "Create a 90-day business plan for my coaching practice"
22. "What are 3 revenue streams I should consider?"
23. "Help me prioritize: [list of ideas]"
24. "What's the one thing I should focus on this week?"

## Sales & Outreach (25-30)

25. "Write a LinkedIn connection request to a potential client"
26. "Draft a follow-up message after a discovery call"
27. "Create a 'soft launch' announcement for my new programme"
28. "Write an outreach message to a past client I haven't spoken to in 6 months"
29. "Draft a collaboration pitch to a complementary coach"
30. "Write a 'I'm booking up fast' scarcity message that's not cheesy"

---

**Pro tip:** These work 10x better after Lesson 1 when you've built your QWEN.md.

Made with AI by Jonathan McGuinness — Agentlify Group
GIFT_EOF

echo "  Created: 30-ai-prompts-for-coaches.md"

echo ""
echo "[4/4] Installation complete!"
echo ""
echo "========================================"
echo "  You're ready to go!"
echo "========================================"
echo ""
echo "To start the course:"
echo "  1. Open Qwen Code"
echo "  2. Type: /agentlify:welcome"
echo "  3. Or type: /agentlify:lesson-1 to jump straight in"
echo ""
echo "Course files: $COURSE_DIR"
echo "Gift files:   $GIFTS_DIR"
echo ""
echo "Let's build something great."
echo "— Jonathan"
echo ""
