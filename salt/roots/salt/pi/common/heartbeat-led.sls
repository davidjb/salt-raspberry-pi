# Enable the activity LED 'heartbeat' using Device Tree Overlays
heatbeat led enabled:
  file.append:
    - name: /boot/config.txt
    - text: "dtparam=act_led_trigger=heartbeat"
