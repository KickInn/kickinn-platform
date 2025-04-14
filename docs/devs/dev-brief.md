Kick Inn – Developer Brief (MVP Build)
This brief is designed to onboard one backend developer and one frontend developer into the MVP build of Kick Inn, based on the finalized repository and documentation.

🎯 Project Purpose
Kick Inn is a Web3 + AI venture builder that enables:
	•	Submission of startup problems by ideators
	•	AI agent validation and MVP generation
	•	Smart contract-driven contributor and investor flows
	•	SAFE token creation and investment cycle tracking
The goal is to build and ship the first functioning MVP on Sepolia with full front-to-back integration in ~10 working days.

🧱 Tech Stack Summary
Layer
Tech
Smart Contracts
Solidity (ERC20 SAFE token logic)
Backend
Node.js + Express (or Supabase API)
Frontend
React / Next.js + Tailwind
Wallet
Wagmi + MetaMask integration
DB/Event
PostgreSQL (Supabase compatible)
Deploy
GitHub Actions + Vercel/Railway

🧑‍💻 Developer Roles
Backend
	•	API endpoints for auth, deals, investments, tracking
	•	Connection to smart contracts (read/write)
	•	Writing actions to event_log for KPI dashboards
Frontend
	•	Pages for registration, dashboard, deal submission/viewing
	•	Wallet connect (invest and claim token)
	•	Contributor workflow (accept role, submit deliverable)

🔑 What’s Already Done
✅ All smart contracts (contracts/ folder) ✅ Hardhat deploy script (scripts/deploy.prod.js) ✅ CI/CD workflows for build and deploy ✅ .env template for dev secrets ✅ MVP specs + flowmap + legal + analytics docs (/docs/ folder) ✅ MVP acceptance criteria + developer Gantt

🚀 First Steps (Day 0)
	1	Clone the repo
	2	Read the files:
	◦	README.md
	◦	docs/functional-specs.md
	◦	docs/api-backend-modules.md
	◦	docs/user-flowmap.md
	3	Review the smart contracts in contracts/
	4	Run the following to test locally:
npm install
npx hardhat compile
npx hardhat test

🎯 MVP Outcome Required
	•	Sign up → select role
	•	Submit idea → validate with agent → create deal
	•	Campaign visible to investor
	•	Investment → token minted → wallet receives it
	•	At least 3 events logged per user flow

Questions go to project lead. Devs work on their own branch. Delivery expected in 7–10 days.
