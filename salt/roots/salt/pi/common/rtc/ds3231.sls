# This state enables the DS3231 Real-Time Clock, using the basic RTC config.

# For more details, see:
# https://www.raspberrypi.org/forums/viewtopic.php?t=85683&p=775626
# https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README

include:
  - .

# Enable the DS3231 RTC using Device Tree Overlays
ds3231 enabled:
  file.append:
    - name: /boot/config.txt
    - text: "dtoverlay=i2c-rtc,ds3231"
    - require_in:
      - service: hwclock
