// Kick Inn – Analytics Tracking Layer (MVP + Growth Stack)

// This setup uses Plausible, Segment, and custom backend logging for product + growth KPIs.

/**
 * 1. Event Triggers (Frontend)
 */

export const trackEvent = (eventName, payload = {}) => {
  if (typeof window !== 'undefined' && window.plausible) {
    window.plausible(eventName, { props: payload });
  }
  // Segment example
  if (window.analytics) {
    window.analytics.track(eventName, payload);
  }
  // Custom endpoint (fallback or enrichment)
  fetch('/api/track', {
    method: 'POST',
    body: JSON.stringify({ event: eventName, payload }),
    headers: { 'Content-Type': 'application/json' },
  });
};

/**
 * 2. Events to Track (suggested MVP layer)
 */

// Ideator Actions
trackEvent('IdeaSubmitted', { userId, category });
trackEvent('AI_Validation_GreenFlag', { ideaId });
trackEvent('CampaignPublished', { ideaId });

// Contributor Actions
trackEvent('RoleViewed', { roleId });
trackEvent('RoleAccepted', { roleId });
trackEvent('DeliverableSubmitted', { milestoneId });

// Investor Actions
trackEvent('DealViewed', { dealId });
trackEvent('InvestmentCommitted', { amount, currency });
trackEvent('TokenClaimed', { tokenSymbol });

// General
trackEvent('UserSignedUp', { role });
trackEvent('WalletConnected', { chain });
trackEvent('KYC_Completed', { userId });

/**
 * 3. API endpoint for logging (API route example)
 */

// /pages/api/track.js
export default async function handler(req, res) {
  const { event, payload } = req.body;
  // Save to DB or forward to logging system (Datadog, Amplitude, etc.)
  console.log(`[Track] ${event}`, payload);
  res.status(200).json({ ok: true });
}

/**
 * 4. Dashboard Suggestions
 */
// - Funnel: SignUp → Idea → Validation → Campaign → Invest
// - Token analytics: per idea, avg price, liquidity
// - Role fulfillment: time to match, completion rate
// - User behavior: heatmaps, retention, re-investment
