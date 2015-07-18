include:
  - .user

# pi user needs access to the ``video`` group for /dev/vchiq
extend:
  pi:
    user.present:
      - groups:
        - video
      - require_in:
        - pkg: pi camera utils

# TODO See https://github.com/asb/raspi-config/pull/23
# This is manual for now
#raspi-config camera:
  #cmd.run:
    #- name: raspi-config --enable-camera

# Kernel module for accessing the camera as /dev/video0
bcm2835_v4l2:
  kmod.present:
    - persist: true
    #- require:
      #- cmd: raspi-config camera

# raspistill, raspivid etc
pi camera utils:
  pkg.installed:
    - name: libraspberrypi-bin

python-picamera:
  pkg.installed

python3-picamera:
  pkg.installed

imagemagick:
  pkg.installed
