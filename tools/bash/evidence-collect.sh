#!/usr/bin/env bash

# evidence-collect.sh
# Reusable first-pass Linux networking and service evidence collection utility.
#
# Collects service status, recent service logs, listening ports, routing, external reachability, and disk usage into a timestamped file.
#
# Example:
#   ./evidence-collect.sh -s cron -u https://cloudwithdavid.com -i 1.1.1.1

set -euo pipefail

header() {
  printf '\n--- %s ---\n' "$1" | tee -a "$output_file"
}

write() {
  printf '%s\n' "$@" | tee -a "$output_file"
}

run_command() {
  "$@" |& tee -a "$output_file"
}

service_name=""
external_ip="8.8.8.8"
test_url="https://example.com"
output_dir="evidence"

while getopts ":s:i:u:h" opt; do
  case "$opt" in
    s)
      service_name="$OPTARG"
      ;;
    i)
      external_ip="$OPTARG"
      ;;
    u)
      test_url="$OPTARG"
      ;;
    h)
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n\n' "$0"
      printf 'Options:\n'
      printf '  -s  Service name to check with systemctl and journalctl\n'
      printf '  -i  External IP to test with ping. Default: 8.8.8.8\n'
      printf '  -u  Test URL to check with curl. Default: https://example.com\n'
      printf '  -h  Show this help message\n'
      exit 0
      ;;
    :)
      printf 'Error: option -%s requires a value\n' "$OPTARG"
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n' "$0"
      exit 1
      ;;
    \?)
      printf 'Error: -%s is an invalid option\n' "$OPTARG"
      printf 'Usage: %s [-s service-name] [-i external-ip] [-u test-url]\n' "$0"
      exit 1
      ;;
  esac
done

current_host="$(hostname)"
current_user="$(whoami)"
timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
file_timestamp="$(date '+%Y%m%d-%H%M%S')"

mkdir -p "$output_dir"

output_file="${output_dir}/${file_timestamp}-${current_host}.txt"

: > "$output_file"

header "Collecting Evidence"
write "Timestamp: $timestamp"
write "Host: $current_host"
write "User: $current_user"

if [[ -n "$service_name" ]]; then
  write "Service: $service_name"
else
  write 'Service: not provided'
fi

write "External IP Target: $external_ip"
write "Test URL: $test_url"

header "Disk Usage"
run_command df -h \
  || write "Disk usage information could not be collected"

header "Service Status"
if [[ -n "$service_name" ]]; then
  run_command systemctl status "$service_name" --no-pager \
    || write "Result: service status could not be collected"
else
  write "Result: skipped because no service name was provided"
fi

header "Recent Journal Logs"
if [[ -n "$service_name" ]]; then
  run_command journalctl -u "$service_name" -n 25 --no-pager \
    || write "Result: recent journal logs could not be collected"
else
  write "Result: skipped because no service name was provided"
fi

header "Listening Ports"
run_command ss -tuln \
  || write "Listening ports information could not be collected"

header "Routing Table"
run_command ip route \
  || write "Routing table information could not be collected"

header "External IP Reachability"
run_command ping -c 4 "$external_ip" \
  || write "External IP reachability check failed; external IP did not respond or could not be reached"

header "External URL Reachability"
run_command curl -sSI --max-time 5 "$test_url" \
  || write "External URL reachability check failed; external URL did not return a reachable HTTP response"

printf 'Evidence saved to: %s\n' "$output_file"
