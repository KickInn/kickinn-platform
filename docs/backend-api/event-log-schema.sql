-- Kick Inn – Event Log Schema
-- Used for analytics, smart triggers, campaign monitoring

CREATE TABLE IF NOT EXISTS event_log (
  id SERIAL PRIMARY KEY,
  event TEXT NOT NULL,
  payload JSONB DEFAULT '{}'::jsonb,
  user_id UUID,
  wallet_address TEXT,
  role TEXT,
  source_page TEXT,
  ip_address TEXT,
  user_agent TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Optional indexes for performance
CREATE INDEX IF NOT EXISTS idx_event_log_event ON event_log(event);
CREATE INDEX IF NOT EXISTS idx_event_log_user_id ON event_log(user_id);
CREATE INDEX IF NOT EXISTS idx_event_log_created_at ON event_log(created_at);
