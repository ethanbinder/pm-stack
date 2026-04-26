> [!INFO]
> This template ensures **agentic experiments** are clearly articulated, designed, and communicated across key teams — Product, Analytics, and Software Engineering. The team member responsible for the experiment uses this template and saves it **nested under the relevant Product Spec** when one exists. Otherwise, save it in your team's AI Experiments folder.
>
> Filling this out should:
> 1. **Clarify your experiment design:** clearly articulate what you're testing, why you're testing it, and how success will be measured.
> 2. **Validate measurement readiness:** ensure appropriate **observability** (your experimentation platform + analytics workspace tracking) is fully in place _before_ launch.
> 3. **Strengthen cross-functional alignment:** provide a shared source of truth for Product, Analytics, and Engineering throughout the experiment lifecycle.
> 4. **Enable consistent, comparable experimentation:** standardized structure improves the quality of test setups and the interpretability of results.
> 5. **Build a historical repository of insights:** over time, these templates create a searchable record of all agentic experiments — capturing learnings, informing future work, and making key data readily available across teams.

## 🔍 Overview

| **Driver** | The person driving the experiment. |
| **Analyst** | The analyst responsible for analysis. |
| **Impacted Teams** | Any additional team potentially impacted that should be consulted. |

## 💡 Step 1: Hypothesis & Success

Helpful Reference: [Please please don't A/B test that](https://medium.com/@talraviv/please-please-dont-a-b-test-that-980a9630e4fb)

### What do we want to learn from the experiment, and how do we measure success?

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Driver** | **Hypothesis** | Problem statement, proposed solution, and expected outcome.

_IF [we do X]_
_THEN [Y metric will change]_
_BECAUSE [Z, the reason we believe this]_ |
| **Driver and/or Analytics** | **Primary Metric** | Tests should ideally have one primary metric, with clearly defined measurement. By default, agentic experiment protocols set _AI engagements_ as the Primary Metric. |
| **Driver and/or Analytics** | **Additional Metrics / Guardrails** | Tests can have additional metrics, notably guardrails. By default, agentic experiment protocols also track examples like _Thumbs-Up Rate_, _User Messages_, _Messages per Conversation_, _Latency_, and _Cache Rate_. |

## 🛠️ Step 2: Experiment Details

### What are the experiment details for measurement, and what differs across variants?

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Driver** | **Experiment Name** | Provide the experiment name exactly as it appears in your AI experimentation tool. |
| **Driver** | **Experiment Variants** | Provide the variant names exactly as they appear in your AI experimentation tool. Share any and all details on the various experiences:
- [ ] Control definition
- [ ] Variant A
- [ ] Variant B…

_Note: to attribute KPI impact to a specific change, each variant should differ from another variant by **only one independent variable**. In practice, if you're testing a new prompt with a model update, there should be a variant for (A) Prompt update only and (B) Prompt + Model update._ |
| **Driver** | **Enrollment vs Entry Points** | What is the trigger to assign a user to a variant? This may be opening any entry point of the AI assistant, or a specific entry agent. |

## 🧪 Step 3: Measurement & Observability

### Before we launch the test, do we have proper observability in place?

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Analytics** | **Experiment Tracking Links** | **Experimentation platform** — measures KPI impact across all AI interactions during the experiment, not just those with the agent(s) being tested.<br>**Analytics workspace** — measures KPI impact on messages and conversations originating from the agent(s) being tested. |

### Reviews

| **Role** | **Reviewer** | **Review Status (✅ / ❌)** | **Date of Review (MM/DD/YYYY)** |
| --- | --- | --- | --- |
| **Test Driver** |  |  |  |
| **Analyst** |  |  |  |

## 🧠 Step 4: Experiment Results & Learnings

### Standardized read-out

**Responsible Party: Driver and Analytics**

---

**Experiment Type:** Agent iteration

**TLDR:**

**Learnings:**

**Recommendation:**

**Next Steps (if applicable):**

**Key Dates:**

- Experiment Start / End Date:
- OFA Date (if applicable):

**Key Links:**

- Test Plan
- [Experimentation platform link]
- [Analytics workspace link]
- AI experimentation summary slide

---

## ✅ Final Action Items

- [ ] Ensure this document is tagged / easily findable (nested under the Product Spec is preferred).
- [ ] Share Experiment Results & Learnings in the proper Slack channels and team docs.

---
Built with [Ethan's PM Stack](https://github.com/ethanbinder/pm-stack)
