# gateway3-site

The personal Astro website for [Gateway3](https://gateway3.net), owned by Gateway3B.

Repository: https://github.com/Gateway3B/gateway3-site

## Local development

Use the Node version in `.nvmrc`, run `npm ci`, then `npm run dev`. Build with `npm run build`.
The site uses optional YouTube and Thingiverse API credentials from your local environment; never commit `.env`.

## Repository rename

Renamed from Gateway3B/G3Tech to Gateway3B/gateway3-site; the local folder is `gateway3-site`.
The domain and Astro branding remain gateway3.net. This repository stays personal and is excluded from the intended LLC ownership of g3techhq.

All current naming uses `gateway3-site`: package, repository, local folder, GHCR image `ghcr.io/gateway3b/gateway3-site:latest`, Compose container name, deployment archive and legacy deployment scripts. The deployment scripts now use `~/Documents/gateway3-site` on the remote server. No server changes were performed here.

### Deployment cutover

1. Confirm the renamed repository's publish workflow has successfully pushed `ghcr.io/gateway3b/gateway3-site:latest`. Grant the deployment host access to the new package if private.
2. On the deployment host or in Portainer, update the stack image to `ghcr.io/gateway3b/gateway3-site:latest` and container name to `gateway3-site`. Preserve environment credentials and port `1000:80`.
3. Recreate the stack as one coordinated change: stop/remove the old stack container before starting the replacement because both bind port 1000. In Portainer, redeploy the same stack with the updated Compose. With Compose, run `docker compose down` using the OLD stack definition before `docker compose up -d --pull always` using the new one. Check the resulting container is `gateway3-site`.
4. If using the included legacy SCP deployment scripts, first move the remote checkout/deployment directory to `~/Documents/gateway3-site` and update any scheduled jobs or service paths. The scripts now transfer `gateway3-site.tar` to that directory. They are an alternative to the GHCR/Portainer workflow.
5. Verify https://gateway3.net and its main pages. Update any proxy upstream configured by the old Docker container name. Keep rollback details and the old package until the replacement works; cleanup of old registry artifacts and server containers is not part of this source rename.


The separate private LLC monorepo is intended to be https://github.com/g3techhq/g3tech, containing records, brand masters and the business website. No live DNS or hosting configuration is changed by this repository rename.
