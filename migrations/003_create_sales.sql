-- 003_create_sales
-- One row per checkout: receipt number, totals, cash tendered and change.
--
-- receipt_no is unique so a double-submitted receipt cannot land twice.

CREATE TABLE IF NOT EXISTS sales (
  id            SERIAL PRIMARY KEY,
  receipt_no    TEXT NOT NULL,
  subtotal      NUMERIC NOT NULL DEFAULT 0,
  discount      NUMERIC NOT NULL DEFAULT 0,
  total         NUMERIC NOT NULL,
  payment       NUMERIC NOT NULL,
  change_amount NUMERIC NOT NULL,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS sales_receipt_no_key ON sales (receipt_no);

-- Sales history and daily reports order by this.
CREATE INDEX IF NOT EXISTS idx_sales_created ON sales (created_at);
