-- 001_create_categories
-- Product categories for the POS catalog.
--
-- IF NOT EXISTS: this baseline documents the schema that already lives in the
-- Kroombase project, so the first sync can record the file without failing on
-- tables that were created by hand.

CREATE TABLE IF NOT EXISTS categories (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  sort_order  INTEGER NOT NULL DEFAULT 0,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS categories_name_key ON categories (name);
-- baseline applied via webhook
