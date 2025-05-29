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
    regulatory_approval BOOLEAN,
    sharia_certified BOOLEAN,
    certification_body TEXT,
    transaction_volume INTEGER
);
-- e_commerce table
CREATE TABLE IF NOT EXISTS e_commerce (
  id SERIAL PRIMARY KEY,
  income DOUBLE PRECISION,
  expenditure DOUBLE PRECISION,
  sector VARCHAR(100),
  market_type VARCHAR(100),
  customer_type VARCHAR(100),
  year INTEGER,
  country VARCHAR(100)
);

-- halal_ecommerce table
CREATE TABLE IF NOT EXISTS halal_ecommerce (
  id SERIAL PRIMARY KEY,
  country VARCHAR(100),
  year INTEGER,
  revenue_usd DOUBLE PRECISION,
  sector VARCHAR(50),
  market_type VARCHAR(50),
  customer_type VARCHAR(50),
  growth_rate DOUBLE PRECISION,
  source_url TEXT,
  halal_certification_id VARCHAR(50)
);


-- internet_penetration table
CREATE TABLE IF NOT EXISTS internet_penetration (
  country TEXT,
  year TEXT,
  internet_penetration TEXT
);

-- islamic_digital_signatures table
CREATE TABLE IF NOT EXISTS islamic_digital_signatures (
  id SERIAL PRIMARY KEY,
  country VARCHAR(100),
  year INTEGER,
  blockchain_projects INTEGER,
  halal_supply_chain BOOLEAN,
  smart_contracts INTEGER,
  market_size_usd DOUBLE PRECISION
);

-- islamic_economy_metadata table
CREATE TABLE IF NOT EXISTS islamic_economy_metadata (
  id SERIAL PRIMARY KEY,
  table_name VARCHAR(100),
  source VARCHAR(255),
  description TEXT,
  last_updated DATE
);



-- islamic_msme table
CREATE TABLE IF NOT EXISTS islamic_msme (
  id SERIAL PRIMARY KEY,
  country VARCHAR(100),
  year INTEGER,
  msme_count INTEGER,
  digital_adoption_rate DOUBLE PRECISION,
  tool_type VARCHAR(50),
  revenue_impact DOUBLE PRECISION,
  challenges TEXT,
  fatwa_approval BOOLEAN
);

-- msme_ecommerce table
CREATE TABLE IF NOT EXISTS msme_ecommerce (
  id SERIAL PRIMARY KEY,
  sector VARCHAR(100),
  market_type VARCHAR(100),
  customer_type VARCHAR(100),
  income DOUBLE PRECISION,
  expenditure DOUBLE PRECISION,
  year INTEGER,
  country VARCHAR(100),
  is_islamic BOOLEAN
);

-- penetration_rates table
CREATE TABLE IF NOT EXISTS penetration_rates (
  id SERIAL PRIMARY KEY,
  broadband_subscriptions DOUBLE PRECISION,
  pay_tv_penetration DOUBLE PRECISION,
  digital_signature_certificates INTEGER,
  four_g_coverage DOUBLE PRECISION,
  five_g_coverage DOUBLE PRECISION,
  year INTEGER,
  country VARCHAR(100)
);

