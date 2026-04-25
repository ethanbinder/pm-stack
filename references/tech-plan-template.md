# Tech Plan: [Feature Name]

**Author**:

**Team(s)**:

**Stakeholders**:

**Dependencies**:

**Objective**:

**Key Outcomes**:

- OKR 1:
- OKR 2:

**PRD & Design Link**:

---

# Problem Statement 🤔
A few sentences — up to 1–3 paragraphs if more depth is needed — describing the problem we are trying to solve and why it is important to solve now. Keep it as short as the problem allows.

## Assumptions 👍
List of assumptions which must be true for this design to be valid.

## Scope of Work 📑

### Must have
- what must your solution solve for?

### Nice to have
- what would you like to solve for, but is not strictly necessary to reach the intended objective?

### Not in scope
- what is out of scope? What, if demanded of the project, would be considered "scope creep"?

---

# Proposal 💍
Describe the system you are proposing to build. Outline architecture, data model, performance considerations, data migrations, etc. Include a mermaid diagram for system design where helpful.

> Tip: under each major subsection of the proposal, add a **Work to Do** bullet list. Those bullets feed directly into the Plan / Milestones tables below.

## Paying Down Tech Debt 💸
Is there an opportunity to pay down tech debt in the area surrounding this system? If so, outline the debt being eliminated as part of this effort.

## Observability 👁️
How will you monitor this system? How will you catch and react to issues in the field?

## Entitlements 🎟️
- **Entitlement Name**: Impact description (how will this entitlement impact the project)
- **Entitlement Name**: Impact description

## QA 🧪

### Design QA 🎨
Outline the Design QA plan, including the work to be done and any special considerations. If this tech plan does not describe a UX feature, omit this section.

### Manual Testing
Highlight testing strategy, dependencies, special requirements, input data, etc.

**Testing Task 1**
- Details:
- QA Days:
- Tickets:

### Automated Testing
Highlight test automation work.

**Automation Task 1**
- Details:
- Dev Days:
- Tickets:

## Security, Privacy, & Fraud/Payments 🤫

### Security Questionnaire ❓

> [!NOTE]
> Please answer Y or N in the boxes below.

<details>
<summary>Click to expand</summary>

- [ ] **Do you need to make anything publicly accessible** (e.g. public S3 bucket, public endpoint)? – strongly discouraged
  - Explanation:
- [ ] **Do you operate under a different domain than your team's standard production domains?** – strongly discouraged
  - Explanation:
- [ ] **Are you using feature flags as an authorization system?** – strongly discouraged
  - Explanation:
- [ ] **Does the mobile app make requests to anything besides your team's standard production API?** – strongly discouraged
  - Explanation:
- [ ] **Are you sending / pulling data to / from third-party services?**
  - Explanation:
- [ ] **Do you have a non-standard authentication or authorization mechanism?** (e.g. not bearer token, not API token, not internal SSO)
  - Explanation:
- [ ] **Do you have any endpoints with no authentication?** Do those endpoints need rate limiting?
  - Explanation:
- [ ] **Are you sharing data across user or account boundaries?**
  - Explanation:
- [ ] **Are you accepting user-generated content as free-form input?** (e.g. URLs, images, chat messages)
  - Explanation:
- [ ] **Do you need to implement user-generated content moderation?**
  - Explanation:
- [ ] **Do you need any form of cryptography?** (e.g. signing, hashing, encryption)
  - Explanation:
- [ ] **Are you adding a new third-party dependency?**
  - Explanation:
</details>

### Privacy Questionnaire ❓

<details>
<summary>Click to expand</summary>

- [ ] **Are you collecting a new type of data? Which specific elements?**
  - Explanation:
- [ ] **Are you storing data? Where?**
  - Explanation:
- [ ] **Are you dealing with regulated data?** (e.g. medical, personal, financial, payment)
  - Explanation:
- [ ] **Are you collecting more than the minimum data required to complete the feature? If so, why?**
  - Explanation:
- [ ] **Is the data not exportable in response to a GDPR / CCPA access request?**
  - Explanation:
- [ ] **Is the data not deletable in response to a GDPR / CCPA erasure request?**
  - Explanation:
- [ ] **Are you considering delaying or skipping privacy implementation? If so, why?**
  - Explanation:
- [ ] **Is there intellectual property associated with this project that you do not want to export?**
  - Explanation:
- [ ] **Are you interacting with a new third-party vendor?**
  - Explanation:
</details>

### Payments & Fraud Questionnaire ❓

<details>
<summary>Click to expand</summary>

- [ ] **Does your work deal with adding, modifying, or reading any payment information?**
  - Explanation: Loop in your team's payments / fraud lead and review your fraud-prevention requirements before you ship.
</details>

### Concerns ‼️

#### Security Concerns
-

#### Privacy Concerns
-

### Data-Subject-Rights Service 🔒
Outline any data-subject-rights changes here and notes on the current state of those integrations.

#### Data Definition Identifiers
Indicate the existing or new data definitions required.

#### ACCESS Requests
Returning data to a user when requested. Outline the schema / SQL call of the data being returned.

#### Erasure Requests
Outline whether we need to hard-delete, scrub, or reduce in granularity any data being stored on an erasure request.

### Data Backup Requirements 💾
Confirm RDS / managed-DB backups are tagged correctly per your team's backup policy.

For data stored in object storage (S3 etc.), answer the following — if you are not storing data in object storage, answer N to all:

- [ ] Are objects added very frequently? (e.g. > once per 10 minutes per user)
- [ ] Are objects overwritten / updated very frequently? (e.g. > 3 times per object within 48 hours)
- [ ] Are objects below 128KB in size on average?

## Alternatives Considered 🤓
Outline other approaches that were considered and ruled out.

---

# Plan 🧠

## Milestone 1: [Milestone Name]
Brief description of what this milestone accomplishes.

| Task | Estimate (dev days) |
|------|---------------------|
| [Mobile] Task 1 description | X |
| [BE] Task 2 description | X |
| [Web] Task 3 description | X |

## Milestone 2: [Milestone Name]
Brief description of what this milestone accomplishes.

| Task | Estimate (dev days) |
|------|---------------------|
| [Mobile] Task 1 description | X |
| [BE] Task 2 description | X |
| [Web] Task 3 description | X |

**Total Dev Days**: X dev days, X parallelized days.

## Plan Caveats ⚠️
Add any special caveats here (e.g. work happening over holiday season, upcoming vacations).

## Rollout 🚢

### Feature Flags ✨
- **Flag Name**:
  - Platforms:
  - Notes:

### Rollout Considerations 🚢
Add any considerations for rolling out this feature (e.g. specific sequencing between platforms).

### Minimum App and Firmware Considerations
Note when the minimum app version will be cut and any minimum firmware considerations.

---

# Appendix 📄

## Decision Log 🗃️
Add any decisions here that change the scope of the project.

## FAQ ❓
List frequently asked questions here.

## Helpful Links
-

## Patents ⚖️
Indicate if we think this design is patentable and complete your team's invention-disclosure form if so.
