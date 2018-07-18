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
## Updated: Time-stamp: <2018-07-17 18:51:35>
##-------------------------------------------------------------------

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
# wait and retry, in order to check pod status
echo "Wait for slow pod start"
n=0
until [ $n -ge 20 ]
do
    [ "$(kubectl get pods -n "$namespace" | grep -c ContainerCreating)" == 0 ] && break
    n=$((n+1))
    echo "Sleep 1 second for pod slow start"
    sleep 1
done

echo "Confirm one $pod_name_pattern running pod for each k8s node"
[ "$(kubectl get nodes | grep -c NAME)" \
      -eq "$(kubectl get pods -n "$namespace" | grep "$pod_name_pattern" | grep -c Running)" ]
kubectl get pods -n "$namespace" | grep "$pod_name_pattern"

echo "List all pods"
kubectl get pods -n "$namespace"

## File: shell_retry.sh ends
