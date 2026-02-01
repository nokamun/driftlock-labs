# Exploration 00: Environment Baseline

## Intent

This exploration establishes the **baseline environment assumptions** DriftLock relies on before any governance decisions, control design, or enforcement mechanisms are introduced.

Before determining *what should be governed*, it is necessary to validate *what is true* about the environment in which governance will operate.

This exploration focuses on **readiness, consistency, and observability**, not enforcement.

---

## Environment as a Governance Surface

Governance failures rarely originate in policy logic.  
They originate earlier, in **unverified assumptions** about the environment itself.

Examples include:
- Different engineers working with different runtimes
- Dependencies installed manually and inconsistently
- Setup steps that exist only in memory or chat threads
- Drift introduced before policy is ever written

DriftLock treats the environment as a **governance surface**, not a convenience.

If baseline conditions cannot be declared and validated, policy outcomes cannot be trusted.

---

## Baseline Assumptions

This exploration validates that the following assumptions are true:

- A consistent Python runtime exists
- Required dependencies are explicitly declared
- Environment setup is reproducible
- Environmental drift can be detected early
- Validation feedback is clear and actionable

These assumptions form the foundation for all subsequent DriftLock explorations.

---

## Artifacts

This exploration relies on the following repository artifacts:

- `requirements.txt`  
  Declares the minimum Python dependencies required for policy engineering work.

- `.devcontainer/devcontainer.json`  
  Defines a reproducible development environment using GitHub Codespaces.

- `scripts/preflight-check.sh`  
  Validates environment readiness and dependency availability.

Each artifact exists to make **intent explicit** and **assumptions observable**.

---

## Validation Mechanism

Environment readiness is validated using a preflight check rather than implicit trust.

Validation is performed via:

```bash
./scripts/preflight-check.sh

