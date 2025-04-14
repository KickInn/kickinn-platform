Kick Inn – Functional Specification Document
Overview
This document translates high-level business requirements into functional modules, user stories, and system logic. It is designed for use by:
	•	Technical product teams  
	•	Solution architects  
	•	Developers (front-end, back-end, smart contract)  
	•	QA/testers  
The scope covers:
	•	Platform functionality for MVP  
	•	User flows and system behavior  
	•	Input/output definitions  
	•	Compliance triggers  



1. User Personas & Roles
1.1 Investor
	•	Can browse deals and filter by category/stage  
	•	Can invest in projects using fiat or crypto  
	•	Must pass KYC/AML  
	•	Can view portfolio (equity + tokens)  
	•	Can trade tokens (post-V1 via DEX)  
1.2 Ideator
	•	Can create and submit business ideas  
	•	Can manage project page and funding progress  
	•	Can recruit contributors (skill-based)  
1.3 Contributor
	•	Can browse role listings per project  
	•	Can apply, accept offers, and sign smart contracts  
	•	Can track deliverables and payout status  
1.4 Platform Admin
	•	Can review/approve deals  
	•	Can flag users or projects (compliance, fraud)  
	•	Can monitor analytics and system health  



2. Core Functional Modules
2.1 Registration & Identity
User Story: As a user, I want to register and identify myself securely.
Features:
	•	Email/password or OAuth sign-in  
	•	Wallet connection (MetaMask / WalletConnect)  
	•	Role selection (Investor / Ideator / Contributor)  
	•	Dynamic KYC flow (based on jurisdiction)  
Input: Name, email, country, wallet address, ID doc Output: User ID, risk profile, role assignment



2.2 Deal Creation & Management
User Story: As an ideator, I want to create a deal and guide it through a structured process.
Flow:
	1	Submit problem → tagged by sector/geography  
	2	AI/refiner suggests framing and early feasibility score  
	3	Define MVP stage (link prototype, video, spec)  
	4	Upload pitch + use of funds  
	5	Configure equity/token split  
	6	Generate tokenomics (with visual preview)  
	7	Launch campaign  
Edge Cases:
	•	Campaign expires without funding → auto-withdrawn  



2.3 Investment & Checkout
User Story: As an investor, I want to discover and invest in startups with clear terms.
Features:
	•	Deal filters: sector, status, team, traction  
	•	Project page: overview, metrics, legal docs  
	•	Invest: enter amount → view token  
	•	Payment via: USDT wallet / MoonPay card-onramp  
	•	Escrow logic with refund conditions  
Input: Amount, confirmation click, payment method Output: Token issued, confirmation receipt



2.4 Token Management
User Story: As a user, I want to manage and view my token positions.
Features:
	•	Token minting per deal (with standard or custom metadata)  
	•	Wallet sync and display for investors  
	•	Smart contract with optional vesting/lockup  
Edge Cases:
	•	Token price instability → suggest MM or limit spreads  



2.5 Contributor Contracting
User Story: As a contributor, I want to see project roles and work under smart-contract terms.
Flow:
	1	Browse open roles → filtered by skills  
	2	View role terms: scope, pay, token %, equity %  
	3	Accept → contract deployed  
	4	Deliverables + milestone tracked in dashboard  
	5	Auto-payment on approval or manual trigger  
Requirements:
	•	IP assignment clause  
	•	Contributor is liable for local tax/compliance unless hired via entity  



3. Cross-Cutting Logic
3.1 Compliance Engine
	•	KYC triggers on volume thresholds or high-risk regions  
	•	Auto-flagging of suspicious patterns  
	•	Token disclaimer pop-ups at checkout (speculative asset alert)  
3.2 Smart Contracts
	•	Templates for: SAFE token, contributor contract, funding vault  
	•	Upgradable design for deal logic  
	•	Gas-optimized structures for low-fee deployment  
3.3 Notifications & Comms
	•	Email/push notifications for:  
	◦	Role application approved  
	◦	Investment confirmed  
	◦	Campaign closing  
	◦	Token unlocked  



4. Analytics & Admin
Platform Analytics
	•	Total funds raised  
	•	Deals launched / closed  
	•	Investor activity by region / type  
	•	Token volume & price changes (via DEX APIs)  
Admin Tools
	•	Approve/reject deals  
	•	User access override  
	•	View smart contract audit logs  
	•	Compliance flag review panel  



5. MVP Development Scope (suggested)
	•	Onboarding module  
	•	Deal creation + review  
	•	Investment engine + escrow  
	•	Token minting (per-project)  
	•	Contributor role system  
	•	Compliance & notifications  
External integrations (DEX, P2P trading, AI contributor matching) can be deferred to Phase 2.



This document will support the full delivery of the platform MVP and serves as the handoff blueprint to product teams, architects, and developers.

