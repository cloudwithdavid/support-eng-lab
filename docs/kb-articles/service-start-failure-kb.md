# KB — Linux Service Fails to Start

> Knowledge Base created in a simulated support lab.

## Purpose

Explain how to troubleshoot a Linux service that fails to start, especially when logs show the service cannot write required startup files because disk space is full.

## When to Use This KB

Use this KB when a Linux-hosted application or internal service is unavailable and the backend service is not starting successfully.

This applies when the issue affects multiple users or a shared application, and support has access to check service status, service logs, disk usage, and related host evidence.

## Symptom Pattern

- Application or dashboard is unavailable
- Issue affects more than one user
- Backend service is failed or inactive
- Service logs show startup failure details
- Disk usage may prevent the service from writing logs, cache files, or runtime files

## Likely Causes

- The service process failed during startup
- The service cannot write required startup, cache, or log files
- A filesystem used by the service is full
- Old logs or application files are consuming too much space
- The service configuration or dependency may be invalid

## Recommended Checks

1. Confirm whether the issue is user-specific or shared
   - Why it matters: A shared failure points away from browser/session troubleshooting and toward the backend system
   - What the result suggests: If multiple users are affected, check the service and host instead of treating it as a single-user access issue

2. Check service status with `systemctl status [service-name] --no-pager`
   - Why it matters: Confirms whether the service is running, stopped, failed, or repeatedly exiting
   - What the result suggests: A failed state means the next step is to review logs for the reason the service could not start

3. Review recent service logs with `journalctl -u [service-name] -n 50 --no-pager`
   - Why it matters: Service logs usually provide the clearest reason for startup failure
   - What the result suggests: Errors such as "no space left on device" point toward disk usage rather than a bad service command or user access issue

4. Check filesystem usage with `df -h`
   - Why it matters: Confirms whether a filesystem is full or nearly full
   - What the result suggests: If a service-related filesystem such as `/var` is full, the service may be unable to write logs, cache, or runtime files

5. Identify large directories with `du -h --max-depth=1 [path]`
   - Why it matters: Shows which directory is consuming the most space
   - What the result suggests: If old service logs are consuming most of the space, cleanup may restore enough room for the service to start

## Typical Resolution

1. Confirm the service is failed with `systemctl status`
2. Review service logs with `journalctl`
3. Confirm disk usage with `df -h`
4. Use `du` to identify the directory consuming space
5. Clear approved old logs or files according to the support cleanup procedure
6. Recheck available disk space
7. Start or restart the affected service
8. Confirm the application is reachable again

## Verification

- Filesystem has usable free space
- Service status shows active/running
- Application or dashboard loads normally
- A basic reachability check such as `curl` returns a valid response

## Escalate If

- Disk space is consumed by unknown application data, database files, container files, or files support is not approved to remove
- Service still fails after space is restored
- Logs show errors outside support scope, such as dependency failure, permission issues, missing secrets, or application code errors
- Restarting or modifying the service is outside the support boundary
- The issue repeats and appears to require log rotation, retention, or capacity changes

## Notes

This KB is based on a simulated Linux service failure case in the lab.

The main lesson is that a service start failure should be narrowed through evidence, not guessed at from the symptom. `systemctl` shows the service state, `journalctl` explains why the service failed, and `df` / `du` help confirm whether disk space is the real cause.

A full filesystem is a common reason services fail because many applications need space to write logs, cache files, PID files, sockets, or temporary startup data. The fix is not simply "restart the service." The stronger support path is to identify what prevented startup, correct the safe underlying condition, restart the service, and verify the application works again.
