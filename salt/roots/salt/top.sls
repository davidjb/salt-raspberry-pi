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
  pi-camera:
    - pi.camera
  opensprinkler:
    - pi.opensprinkler
  pi-test:
    - pi.gsmmodem
    - pi.camera
