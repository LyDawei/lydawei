---
title: "When Startups Confuse Speed with Progress"
description: "What happens when a startup has no staging, no requirements, and no ownership. Lessons from an unstable engineering system."
pubDate: "2026-04-17"
tags: ["career", "software", "startups", "engineering", "reflection"]
draft: false
author: "David Ly"
---

**TL;DR** — I joined a startup expecting fast-paced growth, but found an engineering system with no guardrails. No staging environment, no written requirements, no clear ownership. The result wasn't speed — it was instability. This is what happens when a company confuses movement with progress.

I joined Otovo as a senior full-stack engineer after [more than a decade in the industry](/blog/what-i-did-before-why-i-left-and-what-im-doing-now). I've worked in consulting, transportation systems, genomics, and offline-capable field service platforms.

I left a stable role to take a bet on a startup because I believed in the product and wanted to build something meaningful.

What I walked into wasn't normal startup chaos. It was a system that had no foundation, where ambiguity wasn't something to fix but something people just worked around.

This wasn't about people not trying hard enough. It was about a system that confused moving fast with actually making progress.

## Early Signals of an Unstable Engineering System

Pretty early on, the fundamentals just weren't there:

* No real ticketing or intake process
* No written requirements or clear success criteria
* No staging environment — everything went straight to production
* Testing was basically "does it work in one scenario"
* Slack was being used as long-term documentation

At first I assumed it was just early-stage growing pains. I asked questions, tried to introduce some structure, and put guardrails in place. Not to slow things down, but to make things predictable and safer.

## Incident: Authentication Rewrite Pushed Without Testing

One of the first major red flags was a full authentication rewrite that got pushed straight to production with no testing.

What happened:

* Most employees got locked out
* Operations were immediately disrupted
* It hit early in the morning, even though I had already made it clear my mornings were reserved for my kids

The real issue wasn't the bug. It was the fact that something that risky could go live with no checks in place.

## Incident: Warehouse Integration Skipped UAT

Later, I picked up a warehouse integration that had been sitting around. I built out the endpoints, synced with stakeholders, and we all agreed it was ready for [UAT](https://en.wikipedia.org/wiki/Acceptance_testing#User_acceptance_testing).

Instead, it got pushed directly to production overnight.

What happened:

* The vendor immediately ran into issues
* I became the point of contact for all the fallout
* The day turned into damage control instead of actual progress

Again, the problem wasn't just the mistake. It was that there was no shared understanding of what "ready" meant, and no process to enforce it.

## The Cost of Engineering Heroics

Over time, a pattern started to show up:

* Features shipped with no coordination
* Decisions got made and then communicated after the fact
* Responsibility sat with engineers, but authority didn't
* Production issues were just something to clean up, not learn from

With only two engineers, this kind of setup puts a lot of weight on individuals. Especially when you can't influence the decisions that are creating the problems in the first place.

At some point it clicked. The company wasn't lacking effort. It just couldn't tell the difference between being busy and actually making progress.

## Decision-Making Without Validation

Another pattern was how solutions were being created and shipped.

A lot of changes were generated quickly, often with the help of AI, and pushed out without proper validation.

AI is a useful tool. I use it all the time. But it doesn't replace understanding, testing, or ownership.

In this case, it just made it easier to push unverified changes into production faster.

## Concentrated Authority Without Accountability

Decision-making was centralized, but accountability wasn't.

Key engineering decisions were made by leadership with limited experience, while the consequences landed on the people implementing and supporting the system.

That created a few problems:

* Decisions couldn't really be challenged
* When things went wrong, the responsibility didn't go back to where the decision came from

Over time, that kind of setup erodes trust pretty quickly.

## The V2 Rollout That Broke Trust

Things really started to break down during the V2 rollout:

* The release wasn't complete
* Communication was unclear
* Legal and customer-facing risks showed up late
* Concerns raised ahead of time were brushed off and then reframed later

That's when trust started to go. Not because mistakes happened, but because no one owned them.

While that was going on, I was keeping V1 running and working with operations to actually improve things. That meant gathering requirements, talking to people, and turning their needs into something usable.

At the same time, part of my performance was being measured by lines of code.

Which didn't make sense given everything else I was doing:

* Handling internal tooling and infrastructure
* Dealing with operational issues
* Helping onboard people and set up accounts
* Acting as a bridge between technical and non-technical teams

That kind of metric only works if your job is narrowly scoped. Mine wasn't.

## A Breakdown in Code Ownership

I built a microservice for an inventory system and committed it. Later, during a repo migration, the commit history and the work disappeared.

When I was asked about it, the responsibility got pushed back onto me.

That's the kind of thing that tells you everything you need to know about how ownership works in a system.

## Choosing Integrity Over Endurance

Eventually, I realized I wasn't really engineering anymore. I was just holding things together.

After my equity vested, I decided to leave:

* I gave notice
* I set clear boundaries
* I offered to help with transition and stability
* I stopped taking on new feature work to avoid creating more risk

Shortly after that, my access was revoked without any communication.

At that point, it just confirmed what had already been obvious. The system only worked because people were compensating for it.

## Why I Left a Startup After One Year

I didn't leave because I couldn't handle pressure or complexity. I've worked on much harder systems than this.

I left because unmanaged instability isn't a technical problem — it's an organizational choice.

Startups love to talk about speed and hustle, but that doesn't replace:

* Clear ownership
* Real requirements
* Safe [release processes](https://en.wikipedia.org/wiki/Software_release_life_cycle)
* Trust between people and teams

If your system depends on individuals constantly stepping in to fix things silently, it's already broken.

## What a Functional Startup Engineering System Looks Like

None of the problems here are unique. You see this pattern a lot.

A functional setup, even at a startup, would include:

* A clear path from idea to release
* A [staging environment](https://en.wikipedia.org/wiki/Deployment_environment#Staging) to test changes before production
* Ownership tied to decisions
* Agreement on what "done" means
* Metrics based on outcomes, not just activity

These things don't slow you down. They're what let you move fast without constantly creating new problems.

## What This Experience Reinforced

The pattern was pretty consistent:

No clarity → reactive decisions → production issues → individuals clean it up → nothing actually changes

This experience made a few things non-negotiable for me:

* Ambiguity should be reduced, not ignored
* Asking questions is part of making progress
* Speed without alignment creates more problems later
* Systems shouldn't rely on people quietly compensating
* Metrics should reflect real impact

## Looking Forward

I still believe in building meaningful software. But meaningful systems need more than speed. They need clarity, accountability, and some level of structure.

Because moving fast doesn't matter if you're not moving in the right direction.

If you want to know more about my background, check out [my story](/blog/what-i-did-before-why-i-left-and-what-im-doing-now) or see [what I'm building now](/projects).
