# Codespace Runbook

Codespace Docker needs three fixes that a normal machine does not. `scripts/revive.sh` applies all of them.

## Start or recover everything
```bash
bash scripts/revive.sh
```
It restarts or rebuilds the cluster, repairs networking, reinstalls missing components, reconfigures Vault, and prints a PASS/FAIL table.

## Required fixes (why)
1. Install `docker-proxy` into `/usr/libexec/docker/` (moby-engine omits it).
2. `sysctl net.bridge.bridge-nf-call-iptables=0` (otherwise workers cannot join).
3. Set iptables FORWARD to ACCEPT and add MASQUERADE for 192.168.49.0/24 (otherwise nodes have no internet).
4. Pin minikube v1.34.0 with `--container-runtime=docker`.

## Machine size
Use 4 cores / 16GB. The full stack does not fit reliably on 2 cores / 8GB.

## After a restart
Vault dev mode loses its configuration. `revive.sh` redoes it. Port-forwards are restored with `bash scripts/pf.sh`.
