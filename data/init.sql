-- e_commerce table
CREATE TABLE IF NOT EXISTS public.e_commerce (
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
CREATE TABLE IF NOT EXISTS public.halal_ecommerce (
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

-- household_ict table
CREATE TABLE IF NOT EXISTS public.household_ict (
  id SERIAL PRIMARY KEY,
  internet_usage_rate DOUBLE PRECISION,
  computer_ownership_rate DOUBLE PRECISION,
  mobile_phone_usage DOUBLE PRECISION,
  ict_skills DOUBLE PRECISION,
  youth_computer_skills DOUBLE PRECISION,
  purpose_of_internet_use VARCHAR(255),
  age_group VARCHAR(50),
  sex VARCHAR(10),
  year INTEGER,
  country VARCHAR(100)
);

-- ict_services table
CREATE TABLE IF NOT EXISTS public.ict_services (
  id SERIAL PRIMARY KEY,
  establishment_count INTEGER,
  gross_output DOUBLE PRECISION,
  intermediate_input DOUBLE PRECISION,
  value_added DOUBLE PRECISION,
  year INTEGER,
  country VARCHAR(100)
);

-- internet_penetration table
CREATE TABLE IF NOT EXISTS public.internet_penetration (
  country TEXT,
  year TEXT,
  internet_penetration TEXT
);

-- islamic_digital_signatures table
CREATE TABLE IF NOT EXISTS public.islamic_digital_signatures (
  id SERIAL PRIMARY KEY,
  country VARCHAR(100),
  year INTEGER,
  blockchain_projects INTEGER,
  halal_supply_chain BOOLEAN,
  smart_contracts INTEGER,
  market_size_usd DOUBLE PRECISION
);

-- islamic_economy_metadata table
CREATE TABLE IF NOT EXISTS public.islamic_economy_metadata (
  id SERIAL PRIMARY KEY,
  table_name VARCHAR(100),
  source VARCHAR(255),
  description TEXT,
  last_updated DATE
);

-- islamic_fintech table
CREATE TABLE IF NOT EXISTS public.islamic_fintech (
  id SERIAL PRIMARY KEY,
  platform_name VARCHAR(100),
  country VARCHAR(100),
  year INTEGER,
  transaction_volume_usd DOUBLE PRECISION,
  active_users INTEGER,
  service_type VARCHAR(50),
  funding_rounds DOUBLE PRECISION,
  regulatory_approval BOOLEAN,
  sharia_certified BOOLEAN NOT NULL,
  certification_body VARCHAR(100),
  transaction_volume NUMERIC
);

-- islamic_msme table
CREATE TABLE IF NOT EXISTS public.islamic_msme (
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
CREATE TABLE IF NOT EXISTS public.msme_ecommerce (
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
CREATE TABLE IF NOT EXISTS public.penetration_rates (
  id SERIAL PRIMARY KEY,
  broadband_subscriptions DOUBLE PRECISION,
  pay_tv_penetration DOUBLE PRECISION,
  digital_signature_certificates INTEGER,
  four_g_coverage DOUBLE PRECISION,
  five_g_coverage DOUBLE PRECISION,
  year INTEGER,
  country VARCHAR(100)
);

-- Insert sample data into halal_ecommerce
INSERT INTO public.halal_ecommerce (
  country, year, revenue_usd, sector, market_type, customer_type, growth_rate, source_url, halal_certification_id
) VALUES
('Malaysia', 2020, 1500000, 'Food', 'B2C', 'Muslim', 8.2, 'https://open.dosm.gov.my/digital-economy/ ', 'MY-1234'),
('Malaysia', 2021, 1800000, 'Food', 'B2C', 'Muslim', 9.1, 'https://open.dosm.gov.my/digital-economy/2021 ', 'MY-1235'),
('Indonesia', 2020, 1200000, 'Fashion', 'B2B', 'Non-Muslim', 6.5, 'https://odin.opendatawatch.com/Data/download/2020 ', 'ID-6789'),
('Indonesia', 2021, 1400000, 'Fashion', 'B2B', 'Non-Muslim', 7.3, 'https://odin.opendatawatch.com/Data/download/2021 ', 'ID-6790'),
('Saudi Arabia', 2020, 2000000, 'Pharmaceuticals', 'B2B', 'Muslim', 10.0, 'https://sdaia.gov.sa/en/Services/Pages/eServices-Statistics.aspx/2020 ', 'SA-5555'),
('Saudi Arabia', 2021, 2200000, 'Pharmaceuticals', 'B2B', 'Muslim', 11.5, 'https://sdaia.gov.sa/en/Services/Pages/eServices-Statistics.aspx/2021', 'SA-5556');

-- e_commerce
INSERT INTO public.e_commerce (country, year, income, expenditure, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 2000000, 1800000, 'Retail', 'B2C', 'General'),
('Indonesia', 2020, 1800000, 1600000, 'Retail', 'B2C', 'General'),
('Saudi Arabia', 2020, 2500000, 2200000, 'Retail', 'B2C', 'General');

-- ict_services
INSERT INTO public.ict_services (country, year, establishment_count, gross_output)
VALUES
('Malaysia', 2020, 450, 3000000),
('Indonesia', 2020, 380, 2500000),
('Saudi Arabia', 2020, 600, 4000000);

-- household_ict
INSERT INTO public.household_ict (country, year, internet_usage_rate, computer_ownership_rate, mobile_phone_usage)
VALUES
('Malaysia', 2020, 85.5, 72.3, 95.1),
('Indonesia', 2020, 68.2, 55.4, 89.3),
('Saudi Arabia', 2020, 92.0, 78.9, 98.5);

-- internet_penetration
INSERT INTO public.internet_penetration (country, year, internet_penetration)
VALUES
('Malaysia', '2020', '85%'),
('Indonesia', '2020', '70%'),
('Saudi Arabia', '2020', '92%');

-- islamic_fintech
INSERT INTO public.islamic_fintech (country, year, transaction_volume_usd, active_users, sharia_certified)
VALUES
('Malaysia', 2020, 12000000, 500000, true),
('Indonesia', 2020, 9000000, 400000, true),
('Saudi Arabia', 2020, 15000000, 600000, true);

-- islamic_msme
INSERT INTO public.islamic_msme (country, year, msme_count, digital_adoption_rate)
VALUES
('Malaysia', 2020, 150000, 45.6),
('Indonesia', 2020, 200000, 38.9),
('Saudi Arabia', 2020, 80000, 62.3);

-- e_commerce
INSERT INTO public.e_commerce (country, year, income, expenditure, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 2000000, 1800000, 'Retail', 'B2C', 'General'),
('Indonesia', 2020, 1800000, 1600000, 'Retail', 'B2C', 'General'),
('Saudi Arabia', 2020, 2500000, 2200000, 'Retail', 'B2C', 'General');

-- ict_services
INSERT INTO public.ict_services (country, year, establishment_count, gross_output)
VALUES
('Malaysia', 2020, 450, 3000000),
('Indonesia', 2020, 380, 2500000),
('Saudi Arabia', 2020, 600, 4000000);

-- household_ict
INSERT INTO public.household_ict (country, year, internet_usage_rate, computer_ownership_rate, mobile_phone_usage)
VALUES
('Malaysia', 2020, 85.5, 72.3, 95.1),
('Indonesia', 2020, 68.2, 55.4, 89.3),
('Saudi Arabia', 2020, 92.0, 78.9, 98.5);

-- internet_penetration
INSERT INTO public.internet_penetration (country, year, internet_penetration)
VALUES
('Malaysia', '2020', '85%'),
('Indonesia', '2020', '70%'),
('Saudi Arabia', '2020', '92%');

-- islamic_fintech
INSERT INTO public.islamic_fintech (country, year, transaction_volume_usd, active_users, sharia_certified)
VALUES
('Malaysia', 2020, 12000000, 500000, true),
('Indonesia', 2020, 9000000, 400000, true),
('Saudi Arabia', 2020, 15000000, 600000, true);

-- islamic_msme
INSERT INTO public.islamic_msme (country, year, msme_count, digital_adoption_rate)
VALUES
('Malaysia', 2020, 150000, 45.6),
('Indonesia', 2020, 200000, 38.9),
('Saudi Arabia', 2020, 80000, 62.3);

-- e_commerce
INSERT INTO public.e_commerce (country, year, income, expenditure, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 2000000, 1800000, 'Retail', 'B2C', 'General'),
('Indonesia', 2020, 1800000, 1600000, 'Retail', 'B2C', 'General'),
('Saudi Arabia', 2020, 2500000, 2200000, 'Retail', 'B2C', 'General');

-- halal_ecommerce
INSERT INTO public.halal_ecommerce (country, year, revenue_usd, growth_rate, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 1500000, 8.2, 'Food', 'B2C', 'Muslim'),
('Indonesia', 2020, 1200000, 6.5, 'Fashion', 'B2B', 'Non-Muslim'),
('Saudi Arabia', 2020, 2000000, 10.0, 'Pharmaceuticals', 'B2B', 'Muslim');

-- ict_services
INSERT INTO public.ict_services (country, year, establishment_count, gross_output)
VALUES
('Malaysia', 2020, 450, 3000000),
('Indonesia', 2020, 380, 2500000),
('Saudi Arabia', 2020, 600, 4000000);

-- internet_penetration
INSERT INTO public.internet_penetration (country, year, internet_penetration)
VALUES
('Malaysia', '2020', '85%'),
('Indonesia', '2020', '70%'),
('Saudi Arabia', '2020', '92%');

-- islamic_fintech
INSERT INTO public.islamic_fintech (country, year, transaction_volume_usd, active_users, sharia_certified)
VALUES
('Malaysia', 2020, 12000000, 500000, true),
('Indonesia', 2020, 9000000, 400000, true),
('Saudi Arabia', 2020, 15000000, 600000, true);

-- islamic_msme
INSERT INTO public.islamic_msme (country, year, msme_count, digital_adoption_rate)
VALUES
('Malaysia', 2020, 150000, 45.6),
('Indonesia', 2020, 200000, 38.9),
('Saudi Arabia', 2020, 80000, 62.3);

-- e_commerce
INSERT INTO public.e_commerce (country, year, income, expenditure, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 2000000, 1800000, 'Retail', 'B2C', 'General'),
('Indonesia', 2020, 1800000, 1600000, 'Retail', 'B2C', 'General'),
('Saudi Arabia', 2020, 2500000, 2200000, 'Retail', 'B2C', 'General');

-- halal_ecommerce
INSERT INTO public.halal_ecommerce (country, year, revenue_usd, growth_rate, sector, market_type, customer_type)
VALUES
('Malaysia', 2020, 1500000, 8.2, 'Food', 'B2C', 'Muslim'),
('Indonesia', 2020, 1200000, 6.5, 'Fashion', 'B2B', 'Non-Muslim'),
('Saudi Arabia', 2020, 2000000, 10.0, 'Pharmaceuticals', 'B2B', 'Muslim');

-- ict_services
INSERT INTO public.ict_services (country, year, establishment_count, gross_output)
VALUES
('Malaysia', 2020, 450, 3000000),
('Indonesia', 2020, 380, 2500000),
('Saudi Arabia', 2020, 600, 4000000);

-- internet_penetration
INSERT INTO public.internet_penetration (country, year, internet_penetration)
VALUES
('Malaysia', '2020', '85%'),
('Indonesia', '2020', '70%'),
('Saudi Arabia', '2020', '92%');

-- islamic_fintech
INSERT INTO public.islamic_fintech (country, year, transaction_volume_usd, active_users, sharia_certified)
VALUES
('Malaysia', 2020, 12000000, 500000, true),
('Indonesia', 2020, 9000000, 400000, true),
('Saudi Arabia', 2020, 15000000, 600000, true);

-- islamic_msme
INSERT INTO public.islamic_msme (country, year, msme_count, digital_adoption_rate)
VALUES
('Malaysia', 2020, 150000, 45.6),
('Indonesia', 2020, 200000, 38.9),
('Saudi Arabia', 2020, 80000, 62.3);