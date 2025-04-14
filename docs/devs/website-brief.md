📝 Kick Inn – Website MVP Brief (Brand-Aligned, Developer-Ready)

🎯 Objective
Deliver the MVP web app for Kick Inn, aligned with brand style, user flows, and smart contract integration.
The frontend should:
	•	Support ideator → campaign journey
	•	Handle contributor and investor views
	•	Connect to backend APIs and smart contracts
	•	Reflect Kick Inn’s brand tone: smart, clean, confident

🛠️ Stack
Tech
Use
Next.js 13+
Framework (App Router)
Tailwind CSS
Styling
wagmi + viem + ethers
Wallet connection
Framer Motion
Animations (light use)
Axios
API calls
Deployed on Vercel
Auto from main branch

🎨 Brand Style (from official styleguide)
✅ Fonts Montserrat (Google Font)
	•	Title: Bold, 50px
	•	Subtitle: Light
	•	Body: Regular
✅ Colors
Name
Hex
White
#fcfcff
Light Grey
#d4d4d6
Mid Grey
#97969b
Petrol Green
#4a7874
Mint
#a1c8c3
Ice Blue
#d0e5e4
Black
#000000

📐 Page Structure
Page
Purpose
/
Hero, What is Kick Inn, How it Works, CTA
/register
Role selector (Ideator, Contributor, Investor)
/dashboard
Role-based dashboard
/deals/[id]
Campaign view with deal data and investment logic
/contribute
Open contributor roles

🧩 Components to Build
	•	HeroSection, AboutSection, HowItWorks
	•	DealCard, DealDetail
	•	RoleSelector, ContributorRoleCard
	•	WalletButton, TrackEventHook
	•	CampaignStatusBar, SafeTokenInfo

🔗 API Endpoints (from api-backend-modules.md)
Method
Endpoint
Used for
POST
/api/auth/register
Role registration
POST
/api/deal/create
Idea submission
GET
/api/deal/:id
Deal detail
POST
/api/track
Event logging
POST
/api/investment/commit
Investment

🧠 IDEATOR JOURNEY (Frontend)
Step
What Happens
Frontend Action
1
Ideator registers
/register
2
Submits idea/problem
/dashboard → idea form
3
AI validates idea (stop/go)
Status shown in dashboard
4
If greenlight → campaign
/deals/[id] view
5
Tracks deal metrics
Token, investment, visibility

💎 MVP Acceptance Criteria
	•	Site is mobile responsive
	•	User can register and select a role
	•	Wallet connect + token visibility (Sepolia testnet)
	•	Ideator flow works end-to-end
	•	Contributor can browse and accept tasks
	•	Investor can invest and trigger mint
	•	Backend events logged via /api/track
	•	Branding (fonts/colors/logos) applied
	•	Each component reusable + isolated
