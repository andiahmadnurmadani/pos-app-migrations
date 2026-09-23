-- 004_create_sale_items
-- Line items belonging to a sale; product_name is denormalized so history
-- survives a later rename.
--
-- ON DELETE CASCADE: removing a sale removes its lines with it.

CREATE TABLE IF NOT EXISTS sale_items (
  id           SERIAL PRIMARY KEY,
  sale_id      INTEGER NOT NULL REFERENCES sales (id) ON DELETE CASCADE,
  product_id   INTEGER REFERENCES products (id) ON DELETE SET NULL,
  product_name TEXT NOT NULL,
  price        NUMERIC NOT NULL,
  qty          INTEGER NOT NULL CHECK (qty > 0),
  subtotal     NUMERIC NOT NULL
);

-- Expand a receipt into its lines.
CREATE INDEX IF NOT EXISTS idx_sale_items_sale ON sale_items (sale_id);
