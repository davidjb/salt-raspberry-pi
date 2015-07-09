motion:
  pkg:
    - installed
  service:
    - enable: true
    - reload: true
    - watch:
      - pkg: redis
