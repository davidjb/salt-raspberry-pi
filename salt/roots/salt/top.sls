base:
  '*':
    - pi.common
    - pi.common.keyboard
    - pi.common.timezone
    - pi.common.locale
    - pi.common.openssh
    - pi.common.user
    - pi.common.editor
    - pi.common.raspi-config
    - pi.common.wifi
  pi:
    - pi.gsmmodem
    - pi.tree-camera
  pi-camera:
    - pi.tree-camera
  opensprinkler:
    - pi.opensprinkler
