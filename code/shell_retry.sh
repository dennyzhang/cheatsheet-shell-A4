#!/usr/bin/env bash
## @copyright 2018 DennyZhang.com
## Licensed under MIT
## https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: shell_retry.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2018-07-17>
## Updated: Time-stamp: <2018-08-01 17:37:51>
##-------------------------------------------------------------------

## Sample 1:
# wait/retry and check
echo "Verify pod($pod_syslog) has the given message"
n=0
timeout=10
until [ $n -ge $timeout ]
do
    if kubectl logs --tail=5 -n "$namespace" "$pod_syslog" | grep "$test_msg" 1>/dev/null 2>&1; then
        echo "kubectl logs --tail=5 -n $namespace $pod_syslog"
        kubectl logs --tail=5 -n "$namespace" "$pod_syslog"
        echo "Test OK: Found the generated message: $test_msg"
        return
    fi
    n=$((n+1))
    echo "Sleep 1 second for echo slow flush"
    sleep 1
done

################################################################################
# Sample 2

echo -n "Waiting until flow $NAMESPACE/$NAME is ready"
for i in {1..150}; do  # timeout after 5 minutes
  local typeCount=0
  local readyCount=0
  # TODO: Validate all the types exist. bashfu weak...
  for types in `kubectl get -n $NAMESPACE flows $NAME -o 'jsonpath={.status.conditions[*].type}'`; do
    typeCount=$((typeCount+1))
  done
  for statuses in `kubectl get -n $NAMESPACE flows $NAME -o 'jsonpath={.status.conditions[*].status}'`; do
    if [ "$statuses" = "True" ]; then
      readyCount=$((readyCount+1))
    fi
  done

  if [ $typeCount -eq 5 ]; then
    if [ $readyCount -eq 5 ]; then
      return 0
    fi
  fi
  echo -n "."
  sleep 2
done
## File: shell_retry.sh ends
