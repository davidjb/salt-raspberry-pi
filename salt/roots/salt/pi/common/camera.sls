#raspistill, raspivid etc
pi camera utils:
  pkg.installed:
    - name: libraspberrypi-bin

python-picamera:
  pkg.installed

python3-picamera:
  pkg.installed

imagemagick:
  pkg.installed
