# Kick Inn – Backend Modules & API Spec (MVP)

This file outlines backend service modules, core API endpoints, and data contracts  
to support the MVP functionality as described in the Functional Specs.

---

## 🔧 Backend Modules Overview

Each module is a microservice or decoupled logic component with clear responsibilities.

```json
{
  "auth": "User registration, login, session handling",
  "kyc": "Identity verification, document upload, risk scoring",
  "deal": "Deal creation, status update, founder dashboard",
  "investment": "Investment logic, payment gateway integration, escrow",
  "token": "Token creation, smart contract interface, metadata",
  "contributor": "Role listing, contract signing, milestone tracking",
  "notifications": "Trigger-based email/push communication",
  "admin": "Platform moderation, compliance review, audit log"
}

---

## ✅ Module Descriptions

### `auth`
Handles user login, role assignment, session handling, and wallet linking.

### `kyc`
Third-party or internal verification system that manages user identity checks  
and assigns KYC status levels (pending / verified / flagged).

### `deal`
Core logic for deal creation by AI agent, validation check, tokenomics generation, and investor campaign display.

### `investment`
Manages commitment logic, escrow of funds, token allocation, and refund logic if raise fails.

### `token`
Interacts with smart contracts. Responsible for SAFE token minting, metadata registration, and transfer logic.

### `contributor`
Handles contributor onboarding, role creation, token offer structuring, and contract deployment.

### `notifications`
Sends event-based notifications to users (campaign status, investment confirmed, deliverables approved, etc.)

### `admin`
Internal tooling for compliance, moderation, deal approval, and flagging fraudulent accounts or behaviors.

---

## 🔚 Notes

- Each module should expose a RESTful interface via internal API.
- Role-based access control must be enforced at route-level.
- Each event must trigger a write to the event log for analytics.