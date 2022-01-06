# supabase-postgres

The `supabase/postgres` image with alternate CMDs. Meant for use in GitHub Actions environment where CMD cannot be overridden.

```sh
docker build -t us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-wal-level-logical
docker push us-east4-docker.pkg.dev/assemble-services/apps/supabase-postgres:14.1.0-wal-level-logical
```
