---
title: Building This Portfolio
date: "2026-02-08"
description: A quick look at the tech behind this site, and how a bunch of CSS tricks make planets orbit in your browser.
---

I quickly threw together this new portfolio as I needed a website with some contact info for publishing
an asset on Unity's asset store. But it's a good base to improve on in the future.

## The stack

The site runs on **Nuxt 3** with **Nuxt Content**, which lets me write pages and project entries as simple Markdown files. No database, no admin panel -- just `.md` files in a folder. Styling is handled with **Tailwind CSS**, and the whole thing is deployed as a static site on **GitHub Pages**.

Not too sure about Tailwind yet, it does make the html quite verbose, but was useful to get something working quick.

For the design system, almost everything is driven by CSS custom properties. There's a single `--accent` color, and every other color on the site (links, headings, glows, the dark mode palette) is derived from it using the CSS `hwb()` relative color syntax. Change one variable and the entire site shifts tone.

## The planets

The centerpiece of the homepage is a planet with smaller planets orbiting around it. No canvas, no JavaScript animation libraries -- it's all pure CSS. There are way crazier CSS-based stuff out there, but it was
enough to make me realize once more how much CSS has evolved.

The orbiting planets are the fun part. Each one uses three nested `div` elements, each handling one axis of motion:

- The outer div tilts the whole orbit by -10 degrees
- The middle div handles horizontal movement with an `ease-in` timing function
- The inner div handles vertical movement with `ease-out`

By combining two sine-wave-like motions with different easing curves, you get a smooth elliptical path -- no `requestAnimationFrame` needed. The orbits are sized in `vw` units so they scale naturally with the viewport, and a `--orbit-scale` variable bumps them up on mobile so they don't feel cramped.

Each small planet also has a `::before` pseudo-element with a rotating radial gradient, which gives them a subtle spinning surface texture. It's a small detail, but it makes them feel a little more alive.

## Dark mode

A toggle in the sidebar flips a `.dark` class on the root element. Because everything is wired through CSS custom properties, the transition is a single smooth color shift -- backgrounds, text, planets, glows, all of it. Didn't put much effort into it yet, but it's working!

## What's next

This notebook section is new. I plan to use it to write about things I'm working on, stuff I've learned, and the occasional deep dive into something I find interesting. Stay tuned.
