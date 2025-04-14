Kick Inn – MVP Workplan & Launch Roadmap
This workplan describes the critical path to build, test, and deploy the first fully functional version of Kick Inn (MVP). It assumes your repo is complete and structured.

🧱 1. MVP Scope (Feature Checklist)
✅ Core Functionalities
	•	User sign-up and role assignment (ideator, contributor, investor)
	•	AI agent validating ideas and blocking steps in stop-and-go mode
	•	MVP creation (automated stub for now, can integrate real AI output later)
	•	Contributor role creation with smart contract acceptance
	•	Campaign page generation with tokenomics (SAFE token)
	•	Investment flow including wallet connection and on-chain commitment
	•	Token minting and distribution to investor wallets
	•	Deal milestone status tracking via event logs
🔐 Infrastructure
	•	KYC flow triggered only at investment step
	•	MetaMask wallet connection for contributor and investor onboarding
	•	Contracts deployed on Sepolia (testnet)
	•	Smart contract verification and ABI syncing to backend
📈 Growth Layer (Optional for MVP)
	•	Referral logic: unique invite code or referral link stored in event log
	•	Contributor leaderboard: sorted by number of accepted/closed roles
	•	Campaign social sharing logic (LinkedIn, Twitter prefilled prompts)

🧪 2. Dev Workplan (Sprint Format)
🔹 Week 1 – Contracts, Config & Testnet Deploy
	•	Deploy all contracts to Sepolia (or forked Hardhat network)
	•	Write and run Hardhat test suite (included in contracts.test.js)
	•	Confirm contract ownership and trigger permissions (minting, refunds)
	•	Connect deployed contract addresses to backend config
🔹 Week 2 – Backend Logic + Auth API
	•	Setup Node backend or Supabase API routes based on api-backend-modules.md
	•	Implement login/register with role selector
	•	Begin session/token-based access logic
	•	Create /api/track endpoint to log custom events (JSONB)
	•	Test local event log writes with 3 events: Signup, DealViewed, Invested
🔹 Week 3 – Contributor & Funding Flow
	•	Contributor: Post role, accept, sign contract, submit deliverable
	•	Smart contract milestones: deliverable submitted → agent validates → release
	•	Ideator flow: Submit idea → agent approves → launch campaign
	•	Investor view: browse deal, check terms, connect wallet, invest, receive token
	•	Add minimal UI per persona (3 separate dashboards with dynamic state)
🔹 Week 4 – Frontend Polish + CI/CD + Pre-Launch Setup
	•	Connect repo to GitHub Actions with ci.yml + deploy.yml
	•	Run full build & test pipeline
	•	Create staging frontend with Vercel linked to main branch
	•	Review UI/UX: states, spinners, errors, KYC modal, token alerts
	•	Enable full local + testnet roundtrip: idea → validate → publish → invest → track

🚀 3. Go Live Strategy (Post-MVP)
	•	Protect main branch with pull request reviews
	•	Move Vercel staging to subdomain: app.kickinn.xyz
	•	Configure .env.production on Vercel securely
	•	Activate event logging to track early behavior (connect SQL views)
	•	Add one campaign manually and push live for test group (angel testers, friends)
	•	Use KPI SQL views to monitor:
	◦	Time to funding
	◦	Number of contributors accepted
	◦	Conversion from deal viewed → investment

📍Final Notes
	•	Treat this MVP as closed beta
	•	Validate system architecture, not just features
	•	Prioritize:
	◦	Smoothness of AI validation → campaign launch
	◦	Safe token flow → investor confidence
	◦	Contributor reward clarity → repeat usage
Your goal is not perfection. Your goal is a system that lives and breathes on its own. Let it kick in.
