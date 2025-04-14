-- Kick Inn – Core DB Schema
-- For core user, idea, deal, contributor, and investment models

-- Users
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE NOT NULL,
  wallet_address TEXT UNIQUE,
  role TEXT CHECK (role IN ('ideator', 'contributor', 'investor')) NOT NULL,
  kyc_status TEXT DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT NOW()
);

-- Ideas submitted by ideators
CREATE TABLE IF NOT EXISTS ideas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  problem_statement TEXT NOT NULL,
  category TEXT,
  ai_score NUMERIC,
  status TEXT CHECK (status IN ('submitted', 'validated', 'rejected', 'live')) DEFAULT 'submitted',
  created_at TIMESTAMP DEFAULT NOW()
);

-- Deals launched from validated ideas
CREATE TABLE IF NOT EXISTS deals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  idea_id UUID REFERENCES ideas(id),
  token_address TEXT,
  raise_goal NUMERIC,
  current_raised NUMERIC DEFAULT 0,
  live BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Contributors assigned to projects
CREATE TABLE IF NOT EXISTS contributors (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  role TEXT,
  assigned_to_idea UUID REFERENCES ideas(id),
  status TEXT DEFAULT 'pending',
  started_at TIMESTAMP,
  completed_at TIMESTAMP
);

-- Investments
CREATE TABLE IF NOT EXISTS investments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  deal_id UUID REFERENCES deals(id),
  amount NUMERIC,
  token_symbol TEXT,
  confirmed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);
