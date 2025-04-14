-- Kick Inn – SQL Views for KPI Dashboard Integration (e.g. Metabase / Supabase)
-- These views transform raw event logs into analytic-ready metrics

-- View 1: Ideator Funnel
CREATE OR REPLACE VIEW kpi_ideator_funnel AS
SELECT
  COUNT(DISTINCT CASE WHEN event = 'UserSignedUp' AND payload->>'role' = 'ideator' THEN user_id END) AS ideators,
  COUNT(DISTINCT CASE WHEN event = 'IdeaSubmitted' THEN user_id END) AS ideas_submitted,
  COUNT(DISTINCT CASE WHEN event = 'AI_Validation_GreenFlag' THEN payload->>'ideaId' END) AS ideas_validated,
  COUNT(DISTINCT CASE WHEN event = 'CampaignPublished' THEN payload->>'ideaId' END) AS campaigns_live
FROM event_log;

-- View 2: Investor Funnel
CREATE OR REPLACE VIEW kpi_investor_funnel AS
SELECT
  COUNT(DISTINCT CASE WHEN event = 'UserSignedUp' AND payload->>'role' = 'investor' THEN user_id END) AS investors,
  COUNT(CASE WHEN event = 'DealViewed' THEN 1 END) AS deal_views,
  SUM(CASE WHEN event = 'InvestmentCommitted' THEN (payload->>'amount')::NUMERIC ELSE 0 END) AS total_invested,
  COUNT(DISTINCT CASE WHEN event = 'TokenClaimed' THEN user_id END) AS token_holders
FROM event_log;

-- View 3: Contributor Flow
CREATE OR REPLACE VIEW kpi_contributor_activity AS
SELECT
  COUNT(DISTINCT user_id) FILTER (WHERE event = 'RoleAccepted') AS active_contributors,
  COUNT(*) FILTER (WHERE event = 'DeliverableSubmitted') AS deliverables,
  COUNT(DISTINCT payload->>'roleId') FILTER (WHERE event = 'RoleViewed') AS roles_explored
FROM event_log;

-- View 4: Platform Summary
CREATE OR REPLACE VIEW kpi_platform_summary AS
SELECT
  COUNT(DISTINCT user_id) AS total_users,
  COUNT(*) FILTER (WHERE event = 'KYC_Completed') AS verified_users,
  SUM((payload->>'amount')::NUMERIC) FILTER (WHERE event = 'InvestmentCommitted') AS capital_raised,
  COUNT(DISTINCT payload->>'tokenSymbol') FILTER (WHERE event = 'TokenClaimed') AS tokens_issued
FROM event_log;
