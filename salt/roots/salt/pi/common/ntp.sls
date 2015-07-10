ntp:
  pkg.installed: []
  service.running:
    - enable: true
    - watch:
      - pkg: ntp
