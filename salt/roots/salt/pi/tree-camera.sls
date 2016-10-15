include:
  - pi.common.reduce-sd-activity
  - pi.common.rtc.ds3231
  - pi.common.wifi
  - pi.common.python
  - pi.common.camera
  - pi.common.camera-disable-led
  - pi.common.cifs
  - pi.common.virtualenv
  - pi.common.user

# Install from Git repository for actual application
growtreesgrow:
  git.latest:
    - name: https://github.com/davidjb/growtreesgrow.git
    - target: /home/pi/growtreesgrow
    - user: pi
    - submodules: true
  virtualenv.managed:
    - name: /home/pi/growtreesgrow
    - python: /usr/bin/python
    - distribute: false
    - user: pi
    - require:
      - pkg: virtualenv
      - git: growtreesgrow
  cmd.run:
    - name: ./bin/pip install .
    - cwd: /home/pi/growtreesgrow
    - user: pi
    - require:
      - virtualenv: growtreesgrow
      - user: pi
    - watch:
      - git: growtreesgrow

# Configure environment variables
growtreesgrow environment variables:
  file.managed:
    - name: /home/pi/growtreesgrow/.env
    - user: pi
    - group: pi
    - mode: 600
    - contents_pillar: 'growtreesgrow-env'
    - require:
      - git: growtreesgrow

# Specific script install for regular operation
growtreesgrow regular operation:
  file.managed:
    - name: /home/pi/growtreesgrow/run.sh
    - user: pi
    - group: pi
    - mode: 700
    - contents: |
        #!/bin/bash
        sudo mount -a
        source /home/pi/growtreesgrow/.env
        /home/pi/growtreesgrow/bin/upload-pi-photo -i /mnt/photos -c /home/pi/growtreesgrow/comments.yaml --logfile /home/pi/growtreesgrow/upload.log
    - require:
      - cmd: growtreesgrow
      - file: growtreesgrow environment variables
      - mount: /mnt/photos
  cron.present:
    - name: '/home/pi/growtreesgrow/run.sh'
    - identifier: GROWTREESGROW_UPLOADER
    - user: pi
    - minute: "0,30"
    - require:
      - file: growtreesgrow regular operation

