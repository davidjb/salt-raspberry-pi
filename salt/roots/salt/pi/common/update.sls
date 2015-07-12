include:
  - .reboot

update packages:
  pkg.uptodate:
    - refresh: true

# Update firmware and reboot afterwards
rpi-update:
  cmd.run:
    - env:
      - SKIP_WARNING: '1'
    - require:
      - pkg: update packages
    - watch_in:
      - module: system.reboot

