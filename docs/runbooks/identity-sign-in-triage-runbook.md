# Runbook — Identity Sign-In Triage

> Runbook created in a simulated support lab.

## Purpose

Guide support through triage, initial response, and escalation decisions for single-user sign-in access issues.

## Use This Runbook When

A single user reports sign-in failure, account access loss, or a suspicious sign-in/security prompt.

## Entry Conditions

- Issue appears limited to one user
- Cause is not confirmed at intake
- Support can review account state or sign-in findings

## Triage Questions

- What is the exact symptom?
- Where does the sign-in fail: before password, during MFA, or after authentication?
- What error message, prompt, or security alert is shown?
- Did the user receive any sign-in alert or MFA prompt they did not initiate?
- What changed recently, such as password, device, location, application, or network?
- Is the issue limited to one application or multiple services?

## Decision Flow

### Step 1 — Check for compromise signals first

- action: Ask about unexpected MFA prompts, security alerts, or sign-in notifications. Review sign-in logs for unfamiliar location, time, IP address, or device.
- why this step matters: Possible compromise changes the priority. Containment comes before routine troubleshooting.
- what the result suggests: Suspicious activity confirmed → go to Step 2. No suspicious activity visible → go to Step 3.

### Step 2 — Compromise path: contain immediately

- action: Reset the user's password, revoke active sessions, notify the user, and escalate to security/incident response with sign-in log details and containment actions.
- why this step matters: Support's role is to stop continued unauthorized access. Security owns the deeper investigation.
- what the result suggests: Containment complete → escalate. Support work ends after handoff.

### Step 3 — Check account state

- action: Confirm whether the account is active, locked, disabled, blocked, expired, or otherwise restricted.
- why this step matters: Account state determines the next path. Similar user symptoms can require different actions.
- what the result suggests: Locked → go to Step 4. Active with no restriction → go to Step 5. Disabled, blocked, expired, or restricted outside support authority → escalate to IAM/admin.

### Step 4 — Lockout path: unlock and document

- action: Unlock the account if authorized. Document the likely cause, such as repeated failed attempts, stale saved credentials, or an app/device using an old password. Confirm access is restored.
- why this step matters: Unlocking restores access, but the pattern matters if the lockout returns.
- what the result suggests: User can sign in → resolve. Lockout recurs or cause is unclear → escalate with the pattern documented.

### Step 5 — Credential path: reset only if the symptom supports it

- action: Confirm whether the user fails at password entry or after authentication. If the issue is a forgotten, expired, or incorrect password, verify eligibility and reset the password. Revoke active sessions when appropriate.
- why this step matters: Password reset helps credential failure, but not account restrictions or access policy blocks.
- what the result suggests: Password issue confirmed → reset and verify access. Block occurs after password/MFA succeeds → go to Step 6.

### Step 6 — Post-authentication block: check for access policy or control

- action: Review sign-in logs for policy, compliance, device, location, risk, or application controls. Document the blocking control and unmet condition if visible.
- why this step matters: The credentials worked, but another rule denied access. This is not a password or lockout issue.
- what the result suggests: Policy/control block confirmed → escalate to IAM/security with the control and unmet condition documented. Cause unclear → escalate with all findings.

## Escalation Points

- Suspicious or unauthorized sign-in confirmed → contain first, then escalate to security/incident response
- Account is disabled, blocked, expired, or restricted → escalate to IAM/admin
- Access policy or control blocks sign-in → escalate to IAM/security with the control and unmet condition
- Password reset does not restore access → escalate to IAM with all findings
- Lockout recurs or cannot be explained → escalate with the lockout pattern documented
- MFA, token, session, device, risk, or policy behavior is outside support actions → escalate to IAM/security

## Required Documentation

- Exact symptom and where the sign-in fails
- Error, prompt, alert, or policy/control message shown
- Account state and relevant sign-in log findings
- Whether suspicious activity was reported or confirmed
- Actions taken, such as unlock, password reset, session revocation, user notification, or escalation
- Reason for resolution or escalation
- Verification of restored access or escalation handoff

## Notes

The main skill this runbook trains is classification before action. Many sign-in complaints sound similar at intake, but they can belong to different paths.

- Pre-authentication failure usually points to credentials, account state, or lockout.
- Post-authentication failure usually points to policy, compliance, device, location, risk, or another access control.
- Compromise signals require containment before deeper investigation.

The second skill is boundary recognition. Support may be able to unlock accounts, reset passwords, revoke sessions, and perform initial containment. But policy changes, security incident investigation, account restrictions, and exception decisions require clean escalation with evidence.
