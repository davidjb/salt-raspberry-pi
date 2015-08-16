disable camera led:
  file.append:
    - name: /boot/config.txt
    - text: 'disable_camera_led=1'
