include:
  - pi.common.reboot

max usb current:
  file.append:
    - name: /boot/config.txt
    - text: "max_usb_current=1"
    - watch_in:
      - module: system.reboot
