# Ticket Queue

This file defines the planned ticket coverage for the IT / Cloud Support Lab.

It exists to show the intended scope of practice across support domains,
including which cases are designed to emphasize escalation judgment,
repeatable documentation, KB potential, runbook relevance, and remote
support workflow where applicable.

## Phase 1 — IT Support

### Windows Endpoint

1. Slow PC triage and remediation ✔️
2. Wi-Fi connected but no internet ✔️
3. Printer or drive mapping issue
4. Application install blocked

**Planned runbook:** Endpoint Triage Decision Tree

### Microsoft 365

1. Outlook access loss - M365 license assignment issue
2. Teams desktop sign-in issue
3. OneDrive not syncing
4. Phishing report triage

### Identity & Access

1. Password reset with forced sign-out / session reset ✔️
2. Account unlock with root-cause note ✔️
3. MFA reset / re-enrollment after device loss
4. Suspicious login report and containment workflow

**Planned runbook:** Identity Sign-In Triage

## Phase 2 — Cloud Support

### Linux

1. Disk full causing service failure
2. Service will not start
3. High CPU or memory usage

### Networking

1. No outbound internet due to routing issue
2. DNS resolution failure on Linux
3. Port or service unreachable after local checks

**Planned runbook:** Networking Connectivity Triage

### AWS

1. EC2 unreachable
2. AccessDenied to S3
3. Instance status checks failing

**Planned runbook:** EC2 Reachability Triage

## Remote Support

Some IT support tickets in this lab are also used to practice remote support
workflow. Where relevant, those cases include identity verification, user
consent, session scope, observations made remotely, changes performed during
the session, and any security-relevant notes.

## Notes

This queue is intentionally selective. It prioritizes common, high-signal
support cases over broad coverage.

Not every planned ticket will become a final repository artifact. Some cases
exist primarily for practice, while the strongest patterns may later be
developed into KB articles or runbooks.
