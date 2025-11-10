export default {
  site: 'https://lydawei.com',
  base: '/',
  integrations: [],
  outDir: './dist',
  trailingSlash: 'ignore',
  // Redirect /projects/pokedex to Vercel deployment in dev
  redirects: {
    '/projects/pokedex': 'https://pokedex-ai-test.vercel.app/projects/pokedex'
  }
}; 