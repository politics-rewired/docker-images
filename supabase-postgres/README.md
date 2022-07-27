# supabase-postgres

The `supabase/postgres` image with alternate CMDs. Meant for use in GitHub Actions environment where CMD cannot be overridden.

For each alternate CMD, create a copy of the Dockerfile and add a reasonable suffix.

You need to log into Google Artifact Registry (GAR) before executing these commands. Follow the steps [here](https://cloud.google.com/artifact-registry/docs/docker/authentication#token).
If using the Access Token method, use the existing `gar-docker@assemble-services.iam.gserviceaccount.com` service account. 
You may need to grant your own user account the "Service Account Token Creator" role and wait a bit before permissions update.

```sh
docker build -t us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-YOUR_CHANGES_HERE -f Dockerfile.YOUR_CHANGES_HERE .
docker push us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-YOUR_CHANGES_HERE
```
