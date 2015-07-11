update packages:
  pkg.uptodate:
    - refresh: true

rpi-update:
  cmd.run:
    - env:
      - SKIP_WARNING: '1'
    - require:
      - pkg: update packages

system.reboot:
  module.wait:
    - watch:
      - cmd: rpi-update
