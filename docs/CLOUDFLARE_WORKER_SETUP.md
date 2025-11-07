# Cloudflare Worker Setup for Pokedex Proxy

This guide explains how to deploy the Cloudflare Worker to proxy requests from `lydawei.com/projects/pokedex` to your Vercel deployment.

## Prerequisites

- Cloudflare account with lydawei.com configured
- Access to Cloudflare Dashboard

## Deployment Steps

### 1. Access Cloudflare Workers

1. Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Select your account
3. Click on **Workers & Pages** in the left sidebar

### 2. Create a New Worker

1. Click **Create application**
2. Select **Create Worker**
3. Give it a name (e.g., `pokedex-proxy`)
4. Click **Deploy** to create the worker

### 3. Add the Worker Code

1. After deployment, click **Edit code**
2. Delete the default code
3. Copy and paste the entire contents of `cloudflare-worker-pokedex-proxy.js`
4. Click **Save and Deploy**

### 4. Configure the Route

1. Go back to **Workers & Pages**
2. Click on your `pokedex-proxy` worker
3. Go to the **Settings** tab
4. Scroll down to **Triggers**
5. Click **Add route**
6. Configure the route:
   - **Route**: `lydawei.com/projects/pokedex*`
   - **Zone**: Select `lydawei.com` from the dropdown
7. Click **Save**

### 5. Test the Proxy

Visit `https://lydawei.com/projects/pokedex` in your browser. You should see your Pokedex app, but the URL will remain `lydawei.com/projects/pokedex`.

## How It Works

The worker intercepts all requests to `lydawei.com/projects/pokedex/*` and:
1. Rewrites the URL to `https://pokedex-ai-test.vercel.app/projects/pokedex/*`
2. Forwards the request to Vercel
3. Returns the response to the user
4. Maintains the original URL in the browser

## Troubleshooting

### Issue: 404 errors or blank page

**Solution**: Check that:
- The Vercel app is accessible at `https://pokedex-ai-test.vercel.app/projects/pokedex`
- The route pattern in Cloudflare matches `lydawei.com/projects/pokedex*` (with the asterisk)
- The worker is deployed and active

### Issue: CORS errors

**Solution**: The worker includes CORS headers. If you still see issues, you may need to adjust the `Access-Control-Allow-Origin` header in the worker code.

### Issue: Assets (CSS/JS) not loading

**Solution**: Ensure your Pokedex app is correctly configured with `base: '/projects/pokedex'` in its build configuration so all asset paths are relative to that base path.

## Monitoring

- View worker logs in the Cloudflare Dashboard under **Workers & Pages** > [Your Worker] > **Logs**
- Check analytics for request counts and errors

## Cost

Cloudflare Workers Free Tier includes:
- 100,000 requests per day
- 10ms CPU time per request

This should be more than sufficient for a personal portfolio project.

## Alternative: Using Cloudflare Rules (Simpler but Limited)

If you prefer not to use Workers, you can try Cloudflare Page Rules or Transform Rules, but these have limitations:
- Page Rules don't support true reverse proxying
- Transform Rules may not handle all aspects correctly

The Worker approach is recommended for the best user experience.
