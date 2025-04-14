Kick Inn – MVP Developer Manual (Back-end & Front-end)
This manual is a technical companion to the MVP Workplan. It provides detailed developer guidance to build a fully functional MVP using the Kick Inn codebase.

🧱 Project Assumptions
	•	Hardhat + Solidity for smart contracts
	•	Node.js for backend (Express or Supabase-compatible)
	•	React/Next.js for frontend (with Wallet support)
	•	PostgreSQL (or Supabase) for event logging + dashboard data
	•	GitHub Actions for CI/CD to Sepolia

🛠️ 1. Backend Setup (API Layer)
📂 Folder: kickinn-complete-repo/backend
	•	Dependencies:
	◦	express, dotenv, pg, ethers, cors
	•	Endpoints (see api-backend-modules.md):
	◦	POST /api/auth/register
	◦	POST /api/auth/login
	◦	POST /api/deal/create
	◦	GET /api/deal/:id
	◦	POST /api/track
	◦	POST /api/investment/commit
	•	Env vars from .env.template:
	◦	PRIVATE_KEY, SEPOLIA_RPC_URL, PG_URL
	•	Functions:
	◦	Call deployed contracts from scripts/deploy.prod.js
	◦	Write all app events to table event_log
	◦	Validate user sessions (JWT or Supabase tokens)

🌐 2. Frontend Setup (Next.js / React)
📂 Folder: kickinn-complete-repo/frontend
	•	Dependencies:
	◦	wagmi, ethers, @walletconnect, axios, react-query, tailwindcss
	•	User Flows:
	◦	Sign-up with role (stored in localStorage or backend session)
	◦	Idea submission → sent to /api/deal/create
	◦	Deal listing + filters (fetched from API)
	◦	Investment flow:
	▪	Connect wallet → approve → invest → receive token
	•	Pages to build:
	◦	/register – signup + role
	◦	/dashboard – different views per role
	◦	/deals/[id] – dynamic deal pages (details, invest button, status bar)
	◦	/contribute – available contributor roles

🧪 3. Contracts Integration
	•	Use the deployed addresses from deploy.prod.js
	•	Import ABIs (via artifacts/) into backend + frontend
	•	Interact using ethers.Contract: const contract = new ethers.Contract(address, abi, signer);
	•	await contract.invest({ value: amount });
	•	
	•	MirrorSM should remain optional (for future liquidity extensions)

📊 4. Analytics & Event Logging
	•	Every key action (signup, invest, publish) → log to /api/track
	•	Event log schema = event_log (id, event, payload, user_id, created_at)
	•	SQL views (see kpi-sql-views.md) can be integrated via Metabase or Supabase Dashboard

🚀 5. Deployment Flow (CI/CD + Hosting)
	•	GitHub Actions:
	◦	ci.yml: lint, compile, test
	◦	deploy.yml: run deploy script to Sepolia
	•	Vercel or Netlify frontend (auto from main branch)
	•	Backend can run on Render, Railway, or Supabase Edge Functions
	•	Add secrets (PRIVATE_KEY, RPC URLs) in GitHub + Vercel settings

✅ MVP Acceptance Criteria
	•	User can register and select a role (ideator, contributor, investor)
	•	Idea submission triggers AI stop-and-go validation flow
	•	MVP draft generated and visible in dashboard
	•	Contributor roles created, accepted, and tracked via contract
	•	Campaign page renders dynamically with tokenomics and status
	•	Investor flow: view deal → connect wallet → invest → receive token
	•	SAFE token is minted and visible in wallet (testnet)
	•	Event log captures at least 3 key actions (signup, submit idea, invest) [ ] Sign-up and login work
	•	AI agent flow triggers idea validation (mocked ok)
	•	Deal page + investment workflow fully functional
	•	Token mint + SAFE logic confirmed on-chain
	•	At least 3 tracked events visible in dashboard

With this manual and your repo, you're ready to build. Start local, push to testnet, validate the loop. And let Kick Inn... kick in.
