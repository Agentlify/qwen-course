# Agentlify Qwen Agents Course — Installation Script
# Run this to install the course in your Qwen directory

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Agentlify Qwen Agents Course Setup" -ForegroundColor Cyan
Write-Host "  by Jonathan McGuinness" -ForegroundColor Cyan
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
    "welcome.md",
    "lesson-1.md",
    "lesson-2.md",
    "lesson-3.md",
    "lesson-4.md"
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
# 30 AI Prompts for Coaches & Consultants

Copy any prompt. Paste into Qwen Code. Get personalized results.

**Pro tip:** These work 10x better after Lesson 1 when you've built your QWEN.md.

---

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

---

## Client Communication (11-18)

11. "Draft a welcome email for new coaching clients"
12. "Write a check-in message for mid-programme clients"
13. "Create a testimonial request email that doesn't feel awkward"
14. "Draft a 'I haven't heard from you' nudge that's not annoying"
15. "Write an email to a client who's stuck"
16. "Create a programme completion message with next steps"
17. "Draft a 'I have a spot opening' message for my waitlist"
18. "Write a re-engagement email for past clients"

---

## Strategy & Planning (19-24)

19. "Audit my current offer and tell me what's missing"
20. "What should I charge for [service] based on my experience level?"
21. "Create a 90-day business plan for my coaching practice"
22. "What are 3 revenue streams I should consider?"
23. "Help me prioritize: [list of ideas]"
24. "What's the one thing I should focus on this week?"

---

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

---

Made with AI by Jonathan McGuinness — Agentlify
"@

Set-Content -Path "$giftsDir\30-ai-prompts-for-coaches.md" -Value $prompts30 -Encoding UTF8
Write-Host "  Created: 30-ai-prompts-for-coaches.md" -ForegroundColor Green

# Gift 2: 5 Agent Workflows
$agentWorkflows = @"
# 5 Agent Workflows for Coaches

Copy any workflow. Adapt it. Make it yours.

---

## 1. Client Onboarding Agent

**Use when:** A new client signs up and you need to onboard them smoothly.

You are a client onboarding specialist. Your job is to create a seamless onboarding experience for new coaching clients.

Do the following:

1. Review the client's application/intake form responses
2. Identify their primary goal and biggest blocker
3. Create a personalized welcome message that:
   - Celebrates their decision to invest in themselves
   - Summarizes what they'll get (based on my programme structure)
   - Outlines the next 3 steps clearly
   - Answers any questions they raised in their application
4. Draft a calendar invite description for our first session
5. Suggest 3 "quick win" actions they could take before we meet

Tone: Warm, professional, encouraging
Output: Email-ready copy + calendar description

---

## 2. Content Repurposing Agent

**Use when:** You have one piece of content and want to turn it into 10+.

You are a content repurposing expert. Your job is to maximize the value of existing content.

I will give you one piece of content (video transcript, blog post, podcast episode, etc.).

Do the following:

1. Extract the core message/key takeaways
2. Create the following assets:
   - 1 LinkedIn post (long-form, story-driven)
   - 3 Twitter/X posts (thread format)
   - 1 Instagram caption (with hook, value, CTA)
   - 1 email newsletter (value-add, not salesy)
   - 5 quote graphics ideas (pull quotes from the content)
   - 1 blog post outline (if source wasn't a blog)
   - 3 TikTok/Reels script ideas (30-60 seconds each)
3. Suggest a posting schedule for the next 2 weeks

Tone: Match my voice from QWEN.md
Output: All assets ready to publish

---

## 3. Follow-Up Agent

**Use when:** You need to follow up with prospects, clients, or connections without being annoying.

You are a follow-up specialist who never feels pushy or salesy.

Context: I need to follow up with someone but don't want to be annoying.

Do the following:

1. Ask me:
   - Who am I following up with?
   - What was our last interaction?
   - What do I want to happen next?
   - How long has it been since we spoke?

2. Based on my answers, write 3 follow-up variations:
   - Option A: Light and casual (low pressure)
   - Option B: Value-add forward (include something useful)
   - Option C: Direct and clear (for when timing is right)

3. Suggest a follow-up sequence:
   - When to send each message
   - What to do if they don't respond
   - When to stop following up

Tone: Friendly, helpful, never desperate
Output: 3 message options + sequence plan

---

## 4. Testimonial Collector Agent

**Use when:** You want to gather testimonials from happy clients without it feeling awkward.

You are a testimonial collection specialist. Your job is to make it easy and natural for clients to give feedback.

Do the following:

1. Create a testimonial request email that:
   - Celebrates their progress/completion
   - Asks if they'd be willing to share feedback
   - Makes it stupidly simple (offer questions to answer)
   - Explains how I'll use it (website, social, proposals)
   - Has zero pressure (they can say no)

2. Include 5-7 testimonial prompts like:
   - "What was your biggest challenge before working with me?"
   - "What was the turning point for you?"
   - "What results have you seen?"
   - "What would you say to someone considering this programme?"
   - "Anything else you'd like to share?"

3. Create a follow-up template for non-responders (send 5-7 days later)

4. Draft a "thank you" response for when they submit

Tone: Grateful, warm, low-pressure
Output: Email sequence (request + follow-up + thank you)

---

## 5. Programme Health Check Agent

**Use when:** You're mid-programme with a client and want to assess how things are going.

You are a programme health check specialist. Your job is to assess whether a client is on track or at risk.

Context: I'm working with a client mid-programme and want to check in.

Do the following:

1. Ask me:
   - What programme are they in?
   - How far along are they?
   - What's their stated goal?
   - What activity have they completed (or not)?
   - Any red flags I've noticed?

2. Based on my answers, create:
   - A health score (Green/Yellow/Red) with reasoning
   - A check-in message that addresses the situation
   - 3 suggested actions to get them back on track (if needed)
   - A celebration of wins so far (always include this)

3. If they're at risk (Yellow/Red), also create:
   - A "reset conversation" script for our next call
   - Options for programme adjustment (if needed)
   - A re-engagement plan for the next 2 weeks

Tone: Supportive but honest, action-oriented
Output: Health assessment + check-in message + action plan

---

## How to Use These

1. Copy a workflow
2. Paste into Qwen Code
3. Answer the questions Qwen asks
4. Get personalized output (because of your QWEN.md)

**Pro tip:** Turn these into skills after Lesson 2 so you can run them with one command.

---

Made with AI by Jonathan McGuinness — Agentlify
"@

Set-Content -Path "$giftsDir\5-agent-workflows.md" -Value $agentWorkflows -Encoding UTF8
Write-Host "  Created: 5-agent-workflows.md" -ForegroundColor Green

# Gift 3: 10 Coaching Templates
$templates10 = @"
# 10 Coaching Business Templates

Copy any template. Paste into Qwen Code. Get personalized results.

**Pro tip:** These work 10x better after Lesson 1 when you've built your QWEN.md.

---

## 1. Welcome Email Template

**Use when:** A new client signs up

Write a welcome email for [client name] who just signed up for [programme name].

Include:
- Warm welcome and excitement
- What happens next (onboarding steps)
- How to reach me if they have questions
- A quick win or action they can take today

Tone: [warm and encouraging / professional and clear]

---

## 2. Programme Outline Template

**Use when:** Structuring a new coaching programme

Create a programme outline for [programme name].

Duration: [8 weeks / 12 weeks / 6 months]
Format: [1:1 / group / hybrid]
Price: [€X,XXX]

Include:
- Programme title and subtitle
- Who it's for (3-5 bullet points)
- What they'll get (modules/sessions)
- Transformation/outcome
- Investment and payment options
- Next steps to enroll

---

## 3. Client Check-In Template

**Use when:** Mid-programme check-in with a client

Write a check-in message for [client name] who is halfway through [programme name].

Include:
- Acknowledge their progress so far
- Ask how they're feeling
- Offer support if they're stuck
- Remind them of what's coming next
- Encourage them to keep going

Tone: [supportive / challenging / celebratory]

---

## 4. Testimonial Request Template

**Use when:** Asking a client for a testimonial

Write a testimonial request email for [client name] who just completed [programme name].

Include:
- Celebrate their completion
- Ask if they'd be willing to share a testimonial
- Make it easy (offer questions to answer)
- Explain how I'll use it
- Thank them for their time

Keep it low-pressure and friendly.

---

## 5. Follow-Up Template

**Use when:** Following up after a discovery call

Write a follow-up email after a discovery call with [prospect name].

Include:
- Thank them for their time
- Summarize what we discussed (their goal, blocker, desired outcome)
- Remind them of my offer and how it helps
- Clear next step if they want to move forward
- No pressure, just an open door

Tone: [warm and helpful / professional and direct]

---

## 6. Re-Engagement Template

**Use when:** Reaching out to a past client you haven't spoken to in a while

Write a re-engagement email for [client name] who I haven't spoken to in [X months].

Include:
- Warm hello, no guilt
- Ask how they're doing
- Share one thing I'm working on
- Offer to catch up or support them
- No ask, just connection

Tone: Friendly and genuine

---

## 7. Collaboration Pitch Template

**Use when:** Reaching out to a complementary coach for a collab

Write a collaboration pitch to [coach name] who does [their niche].

Include:
- Why I admire their work
- What I do and who I serve
- A collaboration idea (joint workshop, content swap, referral partnership)
- Why it could be mutually beneficial
- Low-pressure invitation to explore

Tone: Professional but warm

---

## 8. "Spot Opening" Announcement

**Use when:** You have a spot opening in your programme

Write a "I have a spot opening" announcement for my [programme name].

Include:
- Context (someone stepped back / I'm opening one more spot)
- Quick reminder of what the programme is
- Who it's perfect for
- Start date and investment
- Clear CTA (DM me / apply / book a call)
- Light scarcity (one spot, first come first served)

Tone: [exciting / professional / casual]
Platform: [LinkedIn / Instagram / Email]

---

## 9. Programme Completion Template

**Use when:** A client finishes your programme

Write a programme completion message for [client name].

Include:
- Celebrate their completion
- Highlight 2-3 specific wins you noticed
- What's next for them (future goals)
- Offer ongoing support (if applicable)
- Encouragement for the journey ahead

Tone: Celebratory and proud

---

## 10. "Behind the Scenes" Post Template

**Use when:** Building trust with your audience

Write a "behind the scenes" social post about [what I'm working on].

Include:
- What I'm doing right now (building, learning, creating)
- Why it matters to my clients
- A lesson or insight from the process
- How this makes my work better
- Invitation to follow along

Tone: [authentic and vulnerable / inspiring and motivational]
Platform: [LinkedIn / Instagram / Twitter]

---

## How to Use These

1. Copy a template
2. Fill in the [brackets] with your details
3. Paste into Qwen Code
4. Get personalized copy (because of your QWEN.md)

---

Made with AI by Jonathan McGuinness — Agentlify
"@

Set-Content -Path "$giftsDir\10-coaching-templates.md" -Value $templates10 -Encoding UTF8
Write-Host "  Created: 10-coaching-templates.md" -ForegroundColor Green

Write-Host ""
Write-Host "[4/5] Copying gift files from source..." -ForegroundColor Yellow

# Copy gift files from source if they exist
$giftFiles = @(
    "30-ai-prompts-for-coaches.md",
    "5-agent-workflows.md",
    "10-coaching-templates.md"
)

foreach ($file in $giftFiles) {
    $source = Join-Path $sourceDir $file
    $dest = Join-Path $giftsDir $file
    if (Test-Path $source) {
        Copy-Item -Path $source -Destination $dest -Force
        Write-Host "  Copied: $file" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "[5/5] Course installed successfully!" -ForegroundColor Green

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
Write-Host "- Jonathan McGuinness" -ForegroundColor Cyan
Write-Host ""
