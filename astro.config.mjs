export default {
  site: 'https://lydawei.com',
  base: '/',
  integrations: [],
  outDir: './dist',
  trailingSlash: 'ignore',
  // Astro 3's build-time CSS chunking sometimes links a page generated via
  // getStaticPaths to the wrong shared chunk, dropping its own scoped styles.
  // Inlining sidesteps that class of bug for this small a site.
  build: {
    inlineStylesheets: 'always',
  },
  // Redirect /projects/pokedex to Vercel deployment in dev
  redirects: {
    '/projects/pokedex': 'https://pokedex-ai-test.vercel.app/projects/pokedex'
  }
}; 