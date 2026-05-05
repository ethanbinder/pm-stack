# Prototypes

This folder holds interactive prototypes, design specs, and UX documentation produced by PM Builders.

## Types of Files

- **HTML prototypes** -- Interactive mockups that can be opened directly in a browser to demonstrate flows, interactions, or UI concepts
- **Design system docs** -- Documentation of design patterns, component specs, and interaction guidelines
- **UX specs** -- Detailed UX specifications including user flows, edge cases, and content/copy definitions

## Conventions

### Naming
Use descriptive kebab-case filenames that make it clear what the prototype demonstrates:
- `release-flow-redesign-v1.html`
- `eng-manager-small-mode-walkthrough.html`
- `office-hours-batched-prompt-variants.html`

### HTML Prototypes
Include a brief HTML comment at the top of each prototype file explaining what it demonstrates:

```html
<!--
  Prototype: Release Flow Redesign
  Author: [Name]
  Date: YYYY-MM-DD
  Description: Demonstrates the proposed multi-step PR creation flow,
  including the tech-plan gate, draft toggle, and reviewer selection.
-->
```

### Viewing Prototypes
Open HTML files directly in a browser to interact with them -- no build step or server required. For example:

```
open Prototypes/release-flow-redesign-v1.html
```

## Linking from Projects

Reference prototypes from project folders:

```markdown
See the [release flow prototype](../../Prototypes/release-flow-redesign-v1.html) for the proposed UX.
```
