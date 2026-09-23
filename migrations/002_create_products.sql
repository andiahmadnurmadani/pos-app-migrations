-- 002_create_products
-- Sellable products; optional category link, stock tracked on the row.
--
-- Depends on 001: the foreign key is written with IF NOT EXISTS semantics via
-- a plain REFERENCES, so running files out of order fails loudly.

CREATE TABLE IF NOT EXISTS products (
  id          SERIAL PRIMARY KEY,
  category_id INTEGER REFERENCES categories (id) ON DELETE SET NULL,
  name        TEXT NOT NULL,
  price       NUMERIC NOT NULL CHECK (price >= 0),
  stock       INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
  image_path  TEXT,
  is_active   BOOLEAN NOT NULL DEFAULT true,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Category filter on the product grid.
CREATE INDEX IF NOT EXISTS idx_products_category ON products (category_id);
