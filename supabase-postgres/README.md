# supabase-postgres

The `supabase/postgres` image with alternate CMDs. Meant for use in GitHub Actions environment where CMD cannot be overridden.

For each alternate CMD, create a copy of the Dockerfile and add a reasonable suffix.

```sh
docker build -t us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-YOUR_CHANGES_HERE .
docker push us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-YOUR_CHANGES_HERE
```
