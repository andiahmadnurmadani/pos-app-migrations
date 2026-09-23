# pos-app-migrations

Schema migrations for the Kroombase project **pos-app**
(`388c8da742314d3dba5a4d5f794d216a`).

This repository holds only the database migration `.sql` files — not the POS
application source. Kroombase pulls the files from the linked branch and
applies each one once, in name order, each inside its own transaction.

## Link

| Item | Value |
|---|---|
| Kroombase project | `pos-app` (`388c8da742314d3dba5a4d5f794d216a`) |
| Branch | `main` |
| Migrations path | `migrations/` |
| Webhook | `POST https://kroombase.kroombox.com/webhooks/github/388c8da742314d3dba5a4d5f794d216a` |
| Content type | `application/json` |
| Events | `push` |

The webhook secret is stored on the Kroombase project (Project → GitHub panel).
Do not commit it here.

## Files

| File | Creates |
|---|---|
| `001_create_categories.sql` | `categories` |
| `002_create_products.sql` | `products` |
| `003_create_sales.sql` | `sales` |
| `004_create_sale_items.sql` | `sale_items` |

## Conventions

- One statement group per file; name files `NNN_description.sql` so order is stable.
- Use `IF NOT EXISTS` / `ON CONFLICT` for anything that may already exist —
  this baseline documents the live schema on purpose.
- Identifiers are written lower case (migrations run unquoted).
- A failed file stops the run; remaining files are skipped until it is fixed.

## Manual apply (optional)

If you need to run a file by hand against the project schema:

```bash
# via Kroombase query API (session token), or
# psql with the project's connection string from the Kroombase dashboard
```

Pushes to `main` under `migrations/*.sql` trigger the Kroombase webhook and
are recorded in the project's migration history.
