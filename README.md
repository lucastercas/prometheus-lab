# Prometheus Monitoring Lab

This repository is a test laboratory for monitoring with `prometheus`.

The `ansible/` one contains two playbooks,one for configuring the hosts
for monitoring and the other for configuring the hosts that will be monitored.

The monitored hosts will have docker and the `prom/node-exporter` container 
running, sharing its files with the host, and exposing its metrics on port `9100`.
If you want, there is also a instrumented node.js app to run on it.

The monitoring ones will run a kubernetes cluster. The `services/` directory 
stores the kubernetes manifestos for running grafana and prometheus services,
with a nginx ingress.

## Usage

First, you have to have the machines with access to the machine where you will
run this playbook, and write the inventory file to `ansible/inventories/all.yml`:

```yaml
---
all:
  hosts:
    master-01:
      ansible_host: "192.168.1.1"
    worker-01:
      ansible_host: "192.168.2.1"
    monitored-01:
      ansible_host: "192.168.3.1"

  children:
    monitoring:
      children:
        monitoring_masters:
          hosts:
            master-01:
        monitoring_workers:
          hosts:
            worker-01:
    monitored:
      hosts:
        monitored-01:
```

Next, install the required roles with `make install-requirements` on the ansible
directory, this will install the roles described in `ansible/requirements.yml`.

To run the monitoring playbook:
`ansible-playbook -i inventories/all.yml monitoring.yml`

To run the monitored playbook:
`ansible-playbook -i inventories/all.yml monitored.yml`