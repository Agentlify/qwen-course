# Agentlify Qwen Agents Course — Setup Script
# Run this to install the course in your Qwen directory

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Agentlify Qwen Agents Course Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define paths
$sourceDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$qwenDir = "$env:USERPROFILE\.qwen"
$courseDir = "$qwenDir\courses\agentlify"
$skillsDir = "$qwenDir\skills"
$giftsDir = "$qwenDir\gifts"

# Create directories
Write-Host "[1/5] Creating directories..." -ForegroundColor Yellow

if (!(Test-Path $qwenDir)) {
    New-Item -ItemType Directory -Path $qwenDir | Out-Null
    Write-Host "  Created: $qwenDir" -ForegroundColor Green
} else {
    Write-Host "  Exists: $qwenDir" -ForegroundColor Gray
}

if (!(Test-Path $courseDir)) {
    New-Item -ItemType Directory -Path $courseDir | Out-Null
    Write-Host "  Created: $courseDir" -ForegroundColor Green
} else {
    Write-Host "  Exists: $courseDir" -ForegroundColor Gray
}

if (!(Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir | Out-Null
    Write-Host "  Created: $skillsDir" -ForegroundColor Green
} else {
    Write-Host "  Exists: $skillsDir" -ForegroundColor Gray
}

if (!(Test-Path $giftsDir)) {
    New-Item -ItemType Directory -Path $giftsDir | Out-Null
    Write-Host "  Created: $giftsDir" -ForegroundColor Green
} else {
    Write-Host "  Exists: $giftsDir" -ForegroundColor Gray
}

# Copy course files
Write-Host ""
Write-Host "[2/5] Copying course files..." -ForegroundColor Yellow

$filesToCopy = @(
    "README.md",
    "lesson-1.md",
    "lesson-2.md",
    "lesson-3.md",
    "lesson-4.md",
    "welcome.md"
)

foreach ($file in $filesToCopy) {
    $source = Join-Path $sourceDir $file
    $dest = Join-Path $courseDir $file
    if (Test-Path $source) {
        Copy-Item -Path $source -Destination $dest -Force
        Write-Host "  Copied: $file" -ForegroundColor Green
    } else {
        Write-Host "  Missing: $file (skipped)" -ForegroundColor Red
    }
}

# Create gift files
Write-Host ""
Write-Host "[3/5] Creating gift files..." -ForegroundColor Yellow

# Gift 1: 30 AI Prompts
$prompts30 = @"
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

## How to Use These

1. Copy a prompt
2. Paste into Qwen Code
3. Add any specific context in [brackets]
4. Hit enter
5. Get personalized results (because of your QWEN.md)

**Pro tip:** These work 10x better after Lesson 1 when you've built your QWEN.md.

---

Made with AI by Jonathan McGuinness — Agentlify Group
"@

Set-Content -Path "$giftsDir\30-ai-prompts-for-coaches.md" -Value $prompts30 -Encoding UTF8
Write-Host "  Created: 30-ai-prompts-for-coaches.md" -ForegroundColor Green

Write-Host ""
Write-Host "[4/5] Course installed successfully!" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installation Complete" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "The Agentlify Qwen Agents Course is ready to go." -ForegroundColor White
Write-Host ""
Write-Host "To start the course:" -ForegroundColor Yellow
Write-Host "  1. Open Qwen Code" -ForegroundColor White
Write-Host "  2. Type: /agentlify:welcome" -ForegroundColor Cyan
Write-Host "  3. Or type: /agentlify:lesson-1 to jump straight in" -ForegroundColor White
Write-Host ""
Write-Host "Course files location:" -ForegroundColor Gray
Write-Host "  $courseDir" -ForegroundColor Gray
Write-Host ""
Write-Host "Gift files location:" -ForegroundColor Gray
Write-Host "  $giftsDir" -ForegroundColor Gray
Write-Host ""
Write-Host "Let's build something great." -ForegroundColor Cyan
Write-Host "- Jonathan" -ForegroundColor Cyan
Write-Host ""
