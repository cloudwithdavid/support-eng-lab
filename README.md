# Support Engineering Lab

- [About](#about)
- [What This Lab Demonstrates](#what-this-lab-demonstrates)
  - [Support Case Handling](#support-case-handling)
  - [Support-Oriented Tooling](#support-oriented-tooling)
- [Case Handling Workflow](#case-handling-workflow)
- [Artifacts](#artifacts)
  - [Tickets](#tickets)
  - [KB Articles](#kb-articles)
  - [Runbooks](#runbooks)
  - [Bash Scripts](#bash-scripts)
  - [Python Scripts](#python-scripts)
- [Repository Structure](#repository-structure)

## About

This is a support engineering lab with a focus on operations and automation, built around simulated ticket case handling and support-oriented Bash/Python tooling.

Its purpose is to develop support judgment, troubleshooting workflow, documentation clarity, escalation discipline, and small operational utilities that make common support work more technical and repeatable.

The lab combines two connected layers of practice:

- **support case handling** through tickets, KB articles, and runbooks
- **support-oriented tooling** through Bash and Python scripts tied to troubleshooting and evidence-gathering tasks

Selected Linux and networking cases are intentionally paired with Bash or Python scripts where scripting can support a bounded part of the troubleshooting workflow.

## What This Lab Demonstrates

### Support Case Handling

- structured support case analysis and troubleshooting
- translation of vague user issues into structured cases
- repeated practice with triage, hypotheses, checks, and escalation judgment
- clear documentation of reasoning, outcomes, and lessons learned
- development of reusable support artifacts such as tickets, KB articles, and runbooks

### Support-Oriented Tooling

- log, service, and health-oriented check creation
- technical evidence collection, formatting, and organization for ticket documentation
- repetitive task automation with lightweight Bash and Python scripting

## Case Handling Workflow

Each case is worked through in a guided loop:

1. perform first-pass reasoning on the case
2. review and tighten the reasoning through guided critique
3. question the checks, findings, resolution, and escalation logic
4. revise the ticket write-up
5. finalize the case record and capture the lesson

This workflow is intended to build troubleshooting skill through structured support thinking.

## Artifacts

### Tickets

Primary case-handling records used to practice issue framing, classification, hypotheses, checks, resolution versus escalation decisions, verification, and debriefing.

- `windows-endpoint/slow-pc.md`
- `windows-endpoint/no-internet-dns-failure.md`
- `identity-access/password-reset-access-loss.md`
- `identity-access/account-unlock-root-cause.md`

### KB Articles

Reusable references that document repeatable issue patterns for future support work.

- `no-internet-dns-failure.md`
- `password-reset-access-loss.md`

### Runbooks

Stepwise operational guides that standardize repeated support workflows and escalation logic.

-

### Bash Scripts

Bash scripts used to reduce repetitive manual troubleshooting work in selected Linux and networking cases.

-

### Python Scripts

Python scripts used to automate support and troubleshooting tasks in selected Linux and networking cases.

-

## Repository Structure

- `docs/tickets/` → simulated support cases
- `docs/kb/` → KB articles for repeatable issue patterns
- `docs/runbooks/` → runbooks for repeatable support workflows
- `tools/bash/` → Bash scripts for common support and troubleshooting tasks
- `tools/python/` → Python scripts for common support and troubleshooting tasks
<!--
- `tools/samples/` → sample files used for script testing
-->
