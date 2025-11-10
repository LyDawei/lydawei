# Conductor Workspace - Astro Blog

This is a Conductor workspace for David Ly's personal website/blog built with Astro.

## Quick Start

### Initial Setup

Run the setup script to install dependencies and verify your environment:

```bash
./setup.sh
```

Or use Conductor's built-in setup command:

```bash
# In Conductor UI, run the "setup" script
```

### Development

Start the development server:

```bash
npm run dev
```

The site will be available at `http://localhost:3000`

### Building

Build for production:

```bash
npm run build
```

Preview the production build:

```bash
npm run preview
```

## Project Structure

```
.
├── src/
│   ├── layouts/
│   │   ├── BaseLayout.astro    # Main layout with navigation
│   │   └── AboutLayout.astro   # About page layout
│   ├── pages/
│   │   ├── index.astro         # Home page
│   │   ├── about.astro         # About page
│   │   ├── blog.astro          # Blog listing page
│   │   ├── projects.astro      # Projects showcase page
│   │   └── blog/               # Individual blog posts
│   └── content/                # Content collections
├── public/
│   └── assets/                 # Static assets (images, etc.)
├── conductor.json              # Conductor configuration
├── setup.sh                    # Setup script
└── package.json               # Project dependencies
```

## Features

- **Static Site Generation**: Built with Astro for optimal performance
- **Blog**: Write blog posts in Markdown
- **Projects Showcase**: Display your projects with links
- **Responsive Design**: Mobile-first, responsive layout
- **Dark Theme**: Professional dark color scheme
- **Animations**: Smooth transitions and hover effects

## Technologies

- **Astro 2.x**: Static site generator
- **JavaScript/TypeScript**: Modern ES6+ syntax
- **CSS**: Custom properties (CSS variables) for theming
- **Node.js**: v18+ recommended

## Conductor Configuration

The `conductor.json` file defines how Conductor interacts with this workspace:

```json
{
  "scripts": {
    "setup": "./setup.sh",           // Initial setup
    "run": "npm run dev",            // Development server
    "runScriptMode": "nonconcurrent" // Run mode
  }
}
```

### Available Conductor Scripts

- **setup**: Runs the setup script to verify environment and install dependencies
- **run**: Starts the Astro development server

## Development Workflow

### Adding a New Blog Post

1. Create a new `.md` or `.mdx` file in `src/pages/blog/`
2. Add frontmatter with metadata (title, date, description)
3. Write your content
4. The post will automatically appear on the blog listing page

### Adding a New Project

1. Edit `src/pages/projects.astro`
2. Add a new project card to the `.projects-grid` section
3. Include project details, tech stack, and links

### Modifying Styles

The project uses CSS custom properties (design tokens) defined in `src/layouts/BaseLayout.astro`:

- Colors: `--color-primary`, `--color-bg-dark`, etc.
- Spacing: `--spacing-xs` through `--spacing-3xl`
- Shadows: `--shadow-sm` through `--shadow-xl`
- Border radius: `--radius-sm` through `--radius-xl`
- Animation timing: `--duration-fast`, `--duration-normal`, `--duration-slow`

Modify these tokens to change the entire site's appearance.

## Troubleshooting

### Port Already in Use

If port 3000 is already in use, Astro will automatically try the next available port (3001, 3002, etc.).

To manually specify a port:

```bash
npm run dev -- --port 4000
```

### Dependencies Not Installing

1. Clear the node_modules and package-lock.json:
   ```bash
   rm -rf node_modules package-lock.json
   ```

2. Run setup again:
   ```bash
   ./setup.sh
   ```

### Build Errors

Check that you're using Node.js v18 or higher:

```bash
node -v
```

If your Node version is too old, update it from https://nodejs.org/

## Deployment

This site can be deployed to various platforms:

### GitHub Pages

```bash
npm run build
# Deploy the dist/ folder to GitHub Pages
```

### Vercel

```bash
# Connect your repository to Vercel
# Vercel will automatically detect Astro and configure the build
```

### Netlify

```bash
# Build command: npm run build
# Publish directory: dist
```

## Additional Resources

- [Astro Documentation](https://docs.astro.build/)
- [Conductor Documentation](https://conductor.build/docs)
- [Project Repository](https://github.com/lydawei/lydawei.github.io)

## Notes

- This workspace is configured for the `projects-page` branch
- Changes should be tested locally before committing
- The setup script is non-interactive and safe to run multiple times
- Node.js v18+ is recommended for best compatibility with Astro 2.x
