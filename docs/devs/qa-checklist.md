# Kick Inn – Manual QA Checklist (MVP)

## ✅ User Roles
- [ ] User can register and select a role
- [ ] Ideator sees dashboard after registration
- [ ] Investor sees list of campaigns
- [ ] Contributor sees available roles

## ✅ AI / Deal Flow
- [ ] Idea submission form works (ideator)
- [ ] AI validation status is displayed
- [ ] Campaign page shows correct status (live/pending)

## ✅ Token & Wallet
- [ ] Wallet connection works (MetaMask)
- [ ] SAFE tokens received after investment
- [ ] Token shows up in user’s wallet (testnet)

## ✅ Investment Flow
- [ ] Deal can be viewed by investor
- [ ] Investment button connects and confirms
- [ ] Investment appears in backend log (event_log)

## ✅ Logs & Analytics
- [ ] Actions are tracked via `/api/track`
- [ ] Events appear in DB (check event_log)
- [ ] KPI dashboard pulls data correctly
