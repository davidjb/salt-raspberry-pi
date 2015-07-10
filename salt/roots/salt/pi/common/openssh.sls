openssh-server:
  pkg.installed: []
  service.running:
    - name: ssh
    - enable: true
    - reload: true
    - watch:
      - pkg: openssh-server

sshd variables:
  file.append:
    - name: /etc/ssh/sshd_config
    - text: AcceptEnv GIT_AUTHOR_EMAIL GIT_AUTHOR_NAME GIT_COMMITTER_EMAIL GIT_COMMITTER_NAME
    - watch_in:
      - service: openssh-server

