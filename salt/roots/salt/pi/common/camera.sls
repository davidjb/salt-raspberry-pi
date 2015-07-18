include:
  - .user

# pi user needs access to the ``video`` group for /dev/vchiq
extend:
  pi:
    user:
      present:
        - groups:
          - video
        - require_in:
          - pkg: pi camera utils

# Kernel module for accessing the camera as /dev/video0
bcm2835_v4l2:
  kmod.present:
    - persist: true

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
