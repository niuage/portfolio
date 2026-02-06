# Portfolio Website

A modern portfolio website built with **Nuxt 4** and **Nuxt Content** for static site generation.

## Features

- **Static Site Generation (SSG)** for blazing fast performance
- **Markdown-based content** - write your projects in markdown files
- **SEO optimized** - pre-rendered HTML for search engines
- **Fully responsive** design
- **Easy to deploy** - works on Vercel, Netlify, Cloudflare Pages, etc.

## Project Structure

```
content/
  projects/          # Your project markdown files go here
    sample-project.md
  index.md          # Homepage content
  about.md          # About page
app/
  pages/
    projects.vue    # Projects listing page
    [...slug].vue   # Catch-all page for rendering markdown
```

## Adding Projects

Create new markdown files in `content/projects/` with this format:

```markdown
---
title: "Project Name"
description: "Short description"
date: 2025-12-15
tech: ["Vue 3", "Node.js", "PostgreSQL"]
featured: true
image: "/images/project.jpg"
github: "https://github.com/username/repo"
demo: "https://demo.example.com"
---

# Your project content here...
```

Check out the [Nuxt Content documentation](https://content.nuxt.com) to learn more.

## Setup

Make sure to install dependencies:

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install

# bun
bun install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm dev

# yarn
yarn dev

# bun
bun run dev
```

## Production

### Generate Static Site

Generate a static version of your portfolio (recommended for portfolios):

```bash
npm run generate
```

This creates a `.output/public/` directory with static HTML files ready to deploy.

### Deploy Static Site

Deploy to:
- **Vercel**: Connect your GitHub repo
- **Netlify**: Drag & drop `.output/public/` folder
- **Cloudflare Pages**: Connect repo or upload folder
- **GitHub Pages**: Push `.output/public/` to gh-pages branch

### Alternative: Node.js Build

Build for Node.js server hosting:

```bash
npm run build
```

Locally preview production build:

```bash
npm run preview
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.
