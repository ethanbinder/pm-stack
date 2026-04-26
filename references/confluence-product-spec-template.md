# [Product/Feature Name] — Product Spec

# **Overview**

| **Context** | [Provide key context and an overview of the project.] |
| **JTBD** | [Outline the top Jobs to Be Done. Format: When ___, I want to ___, so I can ___.] |
| **OKR(s)** | [Which company OKRs or strategic bets this advances.] |
| **Metric(s) of Success** | [KPIs and metrics of success for this project — be specific and numeric.] |
| **Project Goal** | [Specific, measurable target — e.g. "% of DAU engaging," "<X minutes to activate."] |
| **Link to Business Case** | [Link to completed business case template.] |
| **Links to Other Relevant Docs** | [Strategic One Pager · supporting research · prior art.] |
| **Launch Info** | [Fixed launch date or flexible. Quarter or specific milestone — e.g. "must launch no later than [date]" / "target launch is [quarter]".] |
| **Team** | [@ PM · UX Designer · Visual Designer · EM · Eng Lead · Data Lead · Content Designer] |

### Assumptions & Constraints

| **Assumptions** | [What we believe to be true based on experience, knowledge, or expectations.] |
| **Constraints** | [Known limitations the plan must respect — tech, time, budget, regulatory.] |

# **Product Overview**

| **Description of User Experience at Launch** | [Compelling description of the user experience at launch.] |
| **Description of Future State** | [How this could evolve beyond launch.] |

### User Stories

+++ User Stories
- Call out all the functional requirements of the feature.
- This includes the happy path as well as what error, starter, and other states need to exist.
- Call out the logic that powers any states or flows specifically.
- Call out all onboarding requirements.
- Break the requirements into sections that logically make sense based on product scope and application areas.
- Where relevant, include visuals to clarify the requirements.
- Call out any AI assistant requirements, including key data the assistant needs to ingest.
- Call out what weaving needs to happen to make this feature feel cohesive across the product.
This section needs to make sure it has callouts around:
- Platform Support: Which platforms / surfaces should this work on? (e.g. iOS, Android, Web, desktop, watch, embedded).
- Region / Locale Support: Any region-specific availability or localization needs?
- Terminology:
  **MLP = Minimum Lovable Product | In Scope = Must Requirement | Bonus Scope = Extra Sprinkle of Delight | Out of Scope = Not a Requirement**
+++

| **#** | **Requirement** | **MLP** | **Notes** | **Visuals** |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |
|  |  | In Scope |  |  |
|  |  | Out of Scope |  |  |
|  |  | Bonus |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
| **Onboarding** (including education, starter states, calibration, launch, and new-user experience) |
|  |  | In Scope |  |  |
|  |  | Out of Scope |  |  |
|  |  | Bonus |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
| **All States** (happy path, error states, offline mode, various auth/membership states) |
|  |  | In Scope |  |  |
|  |  | Out of Scope |  |  |
|  |  | Bonus |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
| **AI Assistant** (golden questions, key data the assistant needs to ingest) |
|  |  | In Scope |  |  |
|  |  | Out of Scope |  |  |
|  |  | Bonus |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |

| **Rationale for 'Out of Scope'** | [Include rationale for any items out of scope.] |
| **Rationale for 'Bonus'** | [Include rationale for any items that are Bonus.] |

### Designs & Copy

| **Figma (Dev Ready)** | Link: | Required |
| **Figma (Concept)** | Link: | Optional — early on |
| **In-product Copy** | Link: |  |
| **Brand Voice Copy** | Link: |  |
| **Onboarding Copy** | Link: |  |

# Notes for Execution

| **Expensive Decisions** | [In collaboration with Eng and Design, highlight expensive decisions to align on and lock first.] |
| **Need to Live On** | [Highlight things that may change after living on the experience to allow adequate time for testing/evaluation.] |
| **Internal Alpha & Betas** | [Highlight testing approach to live on this experience at the earliest ability.] |

### Dependencies

+++ Dependencies
- As a principle, break dependencies wherever possible — but for a cohesive user experience, sometimes we thoughtfully take them on.
- What projects need to land before this? What do you need from other teams to deliver this to users?
- Are there any future dependencies to consider?
+++

| **Dependent Project** | **Nature of Dependency** | **Severity** |
| --- | --- | --- |
|  |  | [Critical or Important] |
|  |  |  |

### **Plan / Tier Availability**

| **Tier** | **[Tier 1 Name]** [One-line description of what this tier offers.] | **[Tier 2 Name]** [One-line description of what this tier offers.] | **[Tier 3 Name]** [One-line description of what this tier offers.] |
| --- | --- | --- | --- |
| **Available?** | :check_mark: or :no_entry: | :check_mark: or :no_entry: | :check_mark: or :no_entry: |
| **Reasoning** |  |  |  |

| **Any Region Availability or Localization Considerations** |
| --- |
| [Include any region-specific callouts — e.g. availability of feature or localization considerations.] |

### Stakeholders

+++ Stakeholders
List the teams, individuals or projects that will need to be in the loop on project milestones.
When in a ready-to-review state, use '@' to tag them directly so they receive an email, and if you haven't already, consider starting a project-specific Slack channel (format suggestion: #project-name).
+++

| **Team** | **Stakeholders (tag when ready-to-review)** |
| --- | --- |
| Product | [Manager / GPM] |
| Engineering | [EM / Tech Lead] |
| QA | [QA Lead] |
| Analytics | [Analytics partner] |
| UX/Design | [UX Designer · Visual Designer] |
| Data Science | [DS partner] |
| Marketing | [Marketing partner] |
| Content Design | [Content Designer] |

### Reporting

+++ Reporting
Taxonomy reminders
- **Event names** should represent the functional area / feature and are Title Case (e.g. `Sleep Planner`)
- **Property names** are lowercase (e.g. `action`) and we should re-use existing, commonly used properties
- **Property values** are `snake_case`.
General guidelines
- **Only track what we'll actually check / measure**; we do not need to track everything.
- We track user actions that measure adoption / user behavior **that help us answer questions.**
  - _What questions will you need to answer about this feature?_
+++

| **Trigger** | **Track or Screen** | **Event name (if Track) / Screen name (if Screen)** | **Properties (e.g. action, label, category, value, source)** |
| --- | --- | --- | --- |
| _Viewed [Feature Name]_ | _Track_ | _[Feature Name]_ | - _label: [value]_<br>- _action: [view_overview]_<br>- _category: [category]_<br>- _source: [source]_ |
|  |  |  |  |
|  |  |  |  |

### Data Requirements / Privacy

+++ Data Requirements / Privacy
This will inform Engineering as to whether any work related to integrating with or updating the Privacy Service will be required.
+++

| **Question** | **Answer** |
| --- | --- |
| Will we need to collect more data? If so, what is it? Be explicit. | [e.g. capturing a new "Due Date" data point for a Pregnancy feature.] |
| Will we be using an existing data set? If so, has it been added to the Privacy Service (GDPR / CCPA compliance)? | [e.g. a Trends feature that references many existing data points — are all of those already in the Privacy Service?] |
| Will we derive data from an existing data set? | [e.g. deriving Stress from RHR & HRV.] |

### Notes/Open Questions

| **Question** | **Answer** | **Status** |
|  |  |  |
|  |  |  |

# Spec Approval(s)

| **Approver Name** | **Approved** | **Date** |
| --- | --- | --- |
| [Approver name] | :check_mark: or :no_entry: | [Date] |
| [Approver name] | :check_mark: or :no_entry: | [Date] |
| [Approver name] | :check_mark: or :no_entry: | [Date] |

---
Built with [Ethan's PM Stack](https://github.com/ethanbinder/pm-stack)
