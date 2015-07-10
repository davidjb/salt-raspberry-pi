# Kernel module for accessing the camera as /dev/video0
bcm2835-v4l2:
  kmod.present:
    persist: true

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
