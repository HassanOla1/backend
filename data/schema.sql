CREATE TABLE IF NOT EXISTS ict_services (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    country TEXT,
    year INTEGER,
    establishment_count INTEGER,
    gross_output INTEGER,
    intermediate_input INTEGER,
    value_added INTEGER
);

CREATE TABLE IF NOT EXISTS household_ict (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    country TEXT,
    year INTEGER,
    internet_usage_rate REAL,
    computer_ownership_rate REAL,
    mobile_phone_usage REAL,
    ict_skills REAL,
    youth_computer_skills REAL,
    purpose_of_internet_use TEXT,
    age_group TEXT,
    sex TEXT
);

CREATE TABLE IF NOT EXISTS islamic_fintech (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    platform_name TEXT,
    country TEXT,
    year INTEGER,
    transaction_volume_usd INTEGER,
    active_users INTEGER,
    service_type TEXT,
    funding_rounds INTEGER,
    regulatory_approval INTEGER,  -- Changed to INTEGER for SQLite
    sharia_certified INTEGER,     -- Changed to INTEGER for SQLite
    certification_body TEXT,
    transaction_volume INTEGER
);

-- e_commerce table
CREATE TABLE IF NOT EXISTS e_commerce (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  income REAL,                   -- Changed from DOUBLE PRECISION
  expenditure REAL,              -- Changed from DOUBLE PRECISION
  sector TEXT,                   -- Changed from VARCHAR
  market_type TEXT,              -- Changed from VARCHAR
  customer_type TEXT,            -- Changed from VARCHAR
  year INTEGER,
  country TEXT                   -- Changed from VARCHAR
);

-- halal_ecommerce table
CREATE TABLE IF NOT EXISTS halal_ecommerce (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  country TEXT,                  -- Changed from VARCHAR
  year INTEGER,
  revenue_usd REAL,              -- Changed from DOUBLE PRECISION
  sector TEXT,                   -- Changed from VARCHAR
  market_type TEXT,              -- Changed from VARCHAR
  customer_type TEXT,            -- Changed from VARCHAR
  growth_rate REAL,              -- Changed from DOUBLE PRECISION
  source_url TEXT,
  halal_certification_id TEXT    -- Changed from VARCHAR
);

-- internet_penetration table
CREATE TABLE IF NOT EXISTS internet_penetration (
  country TEXT,
  year TEXT,
  internet_penetration TEXT
);

-- islamic_digital_signatures table
CREATE TABLE IF NOT EXISTS islamic_digital_signatures (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  country TEXT,                  -- Changed from VARCHAR
  year INTEGER,
  blockchain_projects INTEGER,
  halal_supply_chain INTEGER,    -- Changed to INTEGER for SQLite
  smart_contracts INTEGER,
  market_size_usd REAL           -- Changed from DOUBLE PRECISION
);

-- islamic_economy_metadata table
CREATE TABLE IF NOT EXISTS islamic_economy_metadata (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  table_name TEXT,               -- Changed from VARCHAR
  source TEXT,                   -- Changed from VARCHAR
  description TEXT,
  last_updated TEXT              -- Changed from DATE (SQLite doesn't have date type)
);

-- islamic_msme table
CREATE TABLE IF NOT EXISTS islamic_msme (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  country TEXT,                  -- Changed from VARCHAR
  year INTEGER,
  msme_count INTEGER,
  digital_adoption_rate REAL,    -- Changed from DOUBLE PRECISION
  tool_type TEXT,                -- Changed from VARCHAR
  revenue_impact REAL,           -- Changed from DOUBLE PRECISION
  challenges TEXT,
  fatwa_approval INTEGER         -- Changed to INTEGER for SQLite
);

-- msme_ecommerce table
CREATE TABLE IF NOT EXISTS msme_ecommerce (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sector TEXT,                   -- Changed from VARCHAR
  market_type TEXT,              -- Changed from VARCHAR
  customer_type TEXT,            -- Changed from VARCHAR
  income REAL,                   -- Changed from DOUBLE PRECISION
  expenditure REAL,              -- Changed from DOUBLE PRECISION
  year INTEGER,
  country TEXT,                  -- Changed from VARCHAR
  is_islamic INTEGER             -- Changed to INTEGER for SQLite
);

-- penetration_rates table
CREATE TABLE IF NOT EXISTS penetration_rates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  broadband_subscriptions REAL,  -- Changed from DOUBLE PRECISION
  pay_tv_penetration REAL,       -- Changed from DOUBLE PRECISION
  digital_signature_certificates INTEGER,
  four_g_coverage REAL,          -- Changed from DOUBLE PRECISION
  five_g_coverage REAL,          -- Changed from DOUBLE PRECISION
  year INTEGER,
  country TEXT                   -- Changed from VARCHAR
);