> [!INFO]
> This template ensures experiments are clearly articulated, designed, and communicated across key teams — Product, Analytics, and Software Engineering. The team member responsible for the experiment uses this template and saves it **nested under the relevant Product Spec**.
>
> Filling this out should:
> 1. Act as a rubric for whether you're clear on **what** you're testing and **why**.
> 2. Flag test-design and architecture requirements to shuttle back into the Product Spec or Tech Plan for Software.
> 3. Ensure Analytics has the inputs to track user groups and metrics, including entry points and minimum builds.
> 4. Confirm decision-making criteria ahead of launching the test.
>
> Over time, these templates form a historical repository of all experiments — capturing key learnings from each to inform future initiatives.

## 🔍 Overview

| **Driver** | The person driving the experiment. |
| **Analyst** | The analyst responsible for analysis. |
| **Technical Lead** | The EM or DS responsible for set-up. |
| **Contributors** | The team contributing to the project (e.g. a platform or infra team). |
| **Impacted Teams** | Any additional team potentially impacted that should be consulted. |

## 💡 Step 1: Proposal

Helpful Reference: [Please please don't A/B test that](https://medium.com/@talraviv/please-please-dont-a-b-test-that-980a9630e4fb)

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Product** | **Hypothesis** | Problem statement, proposed solution, and expected outcome.

_IF [we do X]_
_THEN [Y metric will change]_
_BECAUSE [Z, the reason we believe this]_ |
| **Product** | **Key Supporting Documents** | Please include:
- [ ] Product Spec
- [ ] Figma designs
- [ ] Tech Plan
- [ ] Anything else |
| **Product & Analytics** | **Upside + Intent** | Are there any projected upsides to this test, or upsides this test is specifically targeting to measure? |
| **Product & Analytics** | **Risks** | Are there any risks with running the test? Ask:
- [ ] Is there a plausible downside?
- [ ] Are other projects impacted or at risk?
- [ ] Will this impact larger business outcomes?
- [ ] If the test fails, do we have a **rollback plan**? |
| **Product & Analytics** | **Primary Metric** | Tests should ideally have one primary metric, with clearly defined measurement. |
| **Product & Analytics** | **Additional Metrics** | Tests can have additional metrics, notably guardrails. Teams can also use experiment protocols if running repeated tests on the same set of metrics. |

## ✏️ Step 2: Test Scope

### Before we build the test, is everyone aligned on what's needed for success?

_This is where you flag blockers or concessions made for the test to launch — and return to the Product Spec + Tech Plan as needed._

|  | **Must Have**
What must we have for this experiment to be valid? What must we have for this to be a compelling user experience? | **Nice to Have**
What should we have for this to be a compelling user experience? | **Not In Scope**
What are we saying no to in order to reduce scope and execute the experiment quickly? |
| --- | --- | --- | --- |
| **Product** |  | _e.g. NCC for variant group_ |  |
| **Analytics** | _e.g. event instrumentation added to Product Spec and QA'd ahead of launch._ |  |  |
| **Software** |  |  | _e.g. building the entry point into the experiment service_ |
| **Other Contributors** |  |  |  |

## 🛠️ Step 3: Test Design + Build

### What else is necessary for this test to run seamlessly?

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Product** | **Variants** | Share any and all details on the various experiences:
- [ ] Control definition
- [ ] Variant A
- [ ] Variant B…

Include Figma designs if applicable. |
| **Product** | **User Enrollment** | Who do you want to enroll into this experiment? **Consider how you would account for this — does this require complex feature flags or manual intervention?**
- [ ] Is the experience available for both new and existing users? (Should it be?)
- [ ] What app version do they need to be on?
- [ ] Is the experience available on iOS, Android, web, or other surfaces?
- [ ] Is the experience scoped to a specific user segment (e.g. demographic, locale, plan tier)?
- [ ] Is the experience available across all languages? |
| **Collaborative** | **Enrollment vs Entry Points** | When is a user considered to be in the experiment? If this differs from the experiment-assignment time, that needs to be accounted for. For example, if a user needs to start a new sequenced flow after assignment.

1. Trigger assignment at the entry point.
2. Add a control for looking for the entry point — typically an out-of-the-box option in your experimentation platform; can be controlled for in SQL or your analytics platform if necessary. |
| **Collaborative** | **Experiment Assignment** | _[Use of an experiment service is strongly preferred.]_
- [ ] Experiment Name
- [ ] Feature Flag commentary

If lists were managed manually, record why and link to final CSVs + the logic to pull them. |

## 🧪 Step 4: Test Details

### Before we launch, does everyone understand what's required to make a call?

| **Responsible Party** | **Item** | **Details** |
| --- | --- | --- |
| **Analytics** | **Estimated Test Duration & Sample Sizing** | Time needed to run an experiment for statistical significance, factoring in differing power and significance levels, and highlighting the minimal detectable effect (MDE) — the smallest measurable change the test can reliably detect based on duration and sample size. |
| **Analytics** | **Measurement Requirements** | What data is needed to calculate KPIs for the experiment? |
| **Collaborative** | **Go / No Go Criteria** | What change in our key metrics do we need to see for us to decide this experiment did or did not win? **Be explicit.** |
| **Collaborative** | **Data Quality Checks** | Before a test launches, ensure all requirements for tracking outcomes exist — e.g. avoid an event needing to be added to the next build. |
| **Product & Analytics** | **Experiment Tracking Links** | Your experimentation platform should be sufficient for the vast majority of tests. If tracking ends up in a one-off SQL notebook or your analytics platform, be explicit here on **why** and the **source of truth**. |

### Reviews

| **Role** | **Reviewer** | **Review Status (✅ / ❌)** | **Date of Review (MM/DD/YYYY)** |
| --- | --- | --- | --- |
| **Driver** |  |  |  |
| **Analyst** |  |  |  |
| **Technical Lead** |  |  |  |

## 📝 Study Wrap Up

### What would you want to be able to find a year from now?

| **Outcome** (Product & Analytics) | What is the decision? |
| **Key Takeaways** (Product & Analytics) | - Are there any interesting cuts of the data?
- What are the top things we should know about this experiment?
- Link to any more comprehensive reporting. |
| **Next Steps** (Product & Analytics) | What is happening as a result of this experiment? |

### Standardized Read-out

**Takeaway:**

**Test Overview & Goals:**

**KPI Result:**

**Key Dates:**

- Start Date:
- End Date:
- OFA Date (if applicable):

**Key Links:**

- Test Plan
- Results

## ✅ Final Action Items

- [ ] Ensure this document is tagged / easily findable (nested under the Product Spec is preferred).
- [ ] Share simplified results in your team's document of all tests.
- [ ] Share results in the proper Slack channels and weekly emails.

---
Built with [Ethan's PM Stack](https://github.com/ethanbinder/pm-stack)
