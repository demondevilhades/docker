
### run in pod
curl -ik \
-H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
https://host:6443/api/v1/namespaces/default/pods
