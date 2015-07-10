motion:
  pkg:
    - installed
  service:
    - enable: true
    - watch:
      - pkg: motion
