Kick Inn – MVP Developer Gantt Plan (BE + FE Team Autonomous Mode)
This Gantt chart breaks down the MVP implementation into parallel, coordinated tracks for Backend and Frontend developers, based on the current repository and documentation.

🧠 Assumption
	•	Devs have access to: repo, API specs, contract ABIs, deployment tools
	•	GitHub and Sepolia deploys are tested
	•	MVP is scoped as agent-based deal launcher, campaign viewer, and tokenized investor flow

👥 Roles
	•	Backend Developer (BE): API logic, contract integration, DB/event log
	•	Frontend Developer (FE): UI/UX components, wallet connect, user flows
	•	Optional PM or Tech Lead: to coordinate and QA work across both streams

📅 Gantt (10-Day Sprint)
Day
Backend Tasks
Frontend Tasks
Notes
1
Setup .env, DB, Hardhat
Setup Next.js project, Tailwind, Wallet
Structure bootstrapped
2
Connect to deployed contracts
Build sign-up/role selection form
Use ethers + ABI imports
3
Implement /api/auth/* + /deal/create
Create /register, /dashboard routes
MVP AI logic mocked in backend
4
Track events via /api/track
Build deal submission form
Link to backend endpoint
5
Finalize /api/investment/commit
Build deal viewer /deals/[id]
Wallet connect integration
6
Deploy API to Railway/Supabase
Contributor UI + role accept view
Form + interaction hooks
7
Validate funding + refund via smart contract
Token received state (testnet check)
TokenBSP + Mirror logic shown
8
Integrate with KPI log (event_log)
UI state polish (loading, errors)
Feedback handling UI
9
Full flow test (ideator → investor)
Cross-component test, mobile check
Fix edge cases
10
Final deploy to prod + docs + handoff
Deploy frontend (Vercel or Netlify)
QA & Go-live prep

✅ Delivery Checklist (Both Streams)
	•	Smart contracts interactable from both layers
	•	MVP flow completed: idea → validation → role → campaign → invest → token
	•	SQL logs confirm tracked actions
	•	Safe token issued and visible on Sepolia wallets
	•	CI/CD auto-runs on push
	•	Clean repo, README, docs in /docs
With this plan and the current repo, your developers can start now and ship the MVP in under 2 weeks.
