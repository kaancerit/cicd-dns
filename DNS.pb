- hosts: 127.0.0.1
  connection: local
  gather_facts: false
  vars_files:
    - "vars/COMMON.var"
  tasks:
  - name: "Getting Kerberos Token"
    shell: echo "{{ APPENV[ENVTYPE]['DPASSWORD'] }}"|kinit {{ APPENV[ENVTYPE]['DUSERNAME'] }}
  - name: "Adding DNS record"
    shell: echo -e "server {{ APPENV[ENVTYPE]['VARSERVER'] }}\n update add {{ DNSRECORD }} 86400 a {{ DNSIP }}\n send" | nsupdate -g
