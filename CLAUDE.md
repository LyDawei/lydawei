# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio and blog site for David Ly, built with **Astro 7.x** as a static site generator. Hosted on GitHub Pages at `lydawei.com` with automatic deployment via GitHub Actions on push to `master`.

## Commands

```bash
npm run dev       # Start dev server (localhost:4321)
npm run build     # Production build to ./dist
npm run preview   # Preview production build locally
./setup.sh        # First-time setup (installs deps) -- still checks for Node 18+; the real
                   # requirement is Node >=22.12.0 (see package.json "engines"), setup.sh is stale
```

Requires Node >=22.12.0 (Astro 6+ dropped Node 18/20 support). No test framework is configured — this is a static site.

## Architecture

**Astro SSG** with file-based routing. No client-side JS framework; pages are pure static HTML/CSS.

### Routing & Pages

- `src/pages/` — file-based routing (index, about, blog, projects)
- `src/pages/blog/[...id].astro` — dynamic route for blog posts (renamed from `[...slug].astro` when the Content Layer API landed; params/props use `post.id`, not `post.slug`)
- Blog posts are Markdown files using Astro's **Content Layer API**, defined in `src/content.config.ts` (not `src/content/config.ts` — that path was retired) via a `glob()` loader. Schema: title, description, pubDate (`z.coerce.date()` — a real `Date`, not a string; call `.toISOString()` at any HTML attribute/JSON-LD usage site), tags, author, optional draft flag

### Layouts

- `src/layouts/BaseLayout.astro` — master layout: nav header, sticky profile sidebar, particle animations, design token system via CSS custom properties
- `src/layouts/AboutLayout.astro` — about page variant

### Design System

CSS custom properties defined in BaseLayout for colors, spacing, border-radius, shadows, and animation timing. Dark theme with blue accent (`#64b5f6`). Animations use CSS keyframes with staggered delays; reduced on mobile/touch.

### External Integrations

- **Pokedex project**: Separate Svelte app on Vercel, proxied via Cloudflare Worker at `/projects/pokedex`
- **Conductor**: Dev environment orchestration (`conductor.json` runs setup + dev server)
- **`@astrojs/sitemap`**: generates `dist/sitemap-index.xml` at build time from `site` in `astro.config.mjs`; dev server won't serve it (build-only output)

### Deployment

- GitHub Actions (`.github/workflows/astro.yml`) builds with Node 22 and deploys to GitHub Pages. It's the *only* deploy workflow — an earlier duplicate (`deploy.yml`) triggered on the same `push: master` event and raced it for the same Pages environment; it was deleted rather than fixed
- Custom domain configured via `CNAME` file
- The `github-pages` deployment environment has protection rules limiting deploys to the `master` branch. Manually running the workflow (`gh workflow run` / `workflow_dispatch`) on any other branch builds successfully but the deploy job is rejected automatically — useful for validating a branch's build in real CI without any risk of it going live

## Known Gotchas

- **Astro 3's production build can silently drop scoped styles.** Pages generated via `getStaticPaths` (i.e. `[...id].astro`) were sometimes linked to the wrong shared CSS chunk in `astro build` output — present and correct in `astro dev`, missing only from the production build. `astro.config.mjs` sets `build: { inlineStylesheets: 'always' }` to sidestep this by inlining all component styles per-page instead of relying on external chunks. At this site's CSS volume the inlining cost is negligible; if that ever changes, re-test removing the option before assuming it's still needed.
- **`astro:assets`' `<Image />` needs a `src/` import, not a `public/` path.** The profile photo lives at `src/assets/profile.jpg` for the optimized on-page `<Image />` in `BaseLayout.astro`, but a duplicate copy stays at `public/assets/profile.jpg` for the Open Graph `<meta property="og:image">` tag — OG images are a single crawler-rendered target that doesn't benefit from responsive `srcset`, so it intentionally isn't run through the image pipeline.
