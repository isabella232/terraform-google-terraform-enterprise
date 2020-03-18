#cloud-config
%{ if length(ssh_import_id_usernames) > 0 ~}
ssh_import_id:
%{ for username in ssh_import_id_usernames ~}
- "${username}"
%{ endfor ~}
%{ endif ~}
%{ if distrobution == "ubuntu" ~}

packages:
- jq
- chrony
- ipvsadm
- unzip
- wget
%{ endif ~}

write_files:
- path: /etc/ptfe/ptfe_url
  owner: root:root
  permissions: "0644"
  encoding: b64
  content: "${base64encode(ptfe_url)}"

- path: /etc/ptfe/bootstrap-token
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(bootstrap_token)}"

- path: /etc/ptfe/cluster-api-endpoint
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(cluster_api_endpoint)}"

- path: /etc/ptfe/health-url
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(health_url)}"

- path: /etc/ptfe/assistant-host
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(assistant_host)}"

- path: /etc/ptfe/assistant-token
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(assistant_token)}"

- path: /var/lib/cloud/scripts/per-once/install-ptfe.sh
  owner: root:root
  permissions: "0555"
  encoding: b64
  content: ${base64encode(install_ptfe_sh)}

- path: /etc/ptfe/proxy-url
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(proxy_url)}"
%{ if custom_ca_cert_url != "" ~}

- path: /etc/ptfe/custom-ca-cert-url
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: "${base64encode(custom_ca_cert_url)}"
%{ endif ~}
%{ if distrobution == "ubuntu" ~}

- path: /etc/apt/apt.conf.d/00_aaa_proxy.conf
  owner: root:root
  permissions: "0400"
  encoding: b64
  content: ${base64encode(proxy_conf)}
%{ endif ~}