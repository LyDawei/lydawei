/**
 * Cloudflare Worker: Pokedex Reverse Proxy
 *
 * This worker proxies requests from lydawei.com/projects/pokedex
 * to the Vercel deployment at pokedex-ai-test.vercel.app/projects/pokedex
 *
 * Deploy this to Cloudflare Workers and configure a route for:
 * lydawei.com/projects/pokedex/*
 */

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url)

  // Only handle requests to /projects/pokedex
  if (!url.pathname.startsWith('/projects/pokedex')) {
    return fetch(request)
  }

  // Target Vercel deployment
  const targetUrl = 'https://pokedex-ai-test.vercel.app' + url.pathname + url.search

  // Create new request with modified URL
  const modifiedRequest = new Request(targetUrl, {
    method: request.method,
    headers: request.headers,
    body: request.body,
    redirect: 'follow'
  })

  // Fetch from Vercel
  const response = await fetch(modifiedRequest)

  // Clone response so we can modify headers
  const newResponse = new Response(response.body, response)

  // Add CORS headers if needed
  newResponse.headers.set('Access-Control-Allow-Origin', '*')

  // Remove or modify headers that might cause issues
  newResponse.headers.delete('X-Frame-Options')
  newResponse.headers.delete('Content-Security-Policy')

  return newResponse
}
