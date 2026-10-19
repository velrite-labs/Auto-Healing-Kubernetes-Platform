pkill -f "kubectl port-forward" 2>/dev/null
nohup kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090 >/dev/null 2>&1 &
nohup kubectl port-forward svc/prometheus-grafana -n monitoring 3000:80 >/dev/null 2>&1 &
nohup kubectl port-forward svc/opencost -n opencost 9003:9003 >/dev/null 2>&1 &
sleep 5
