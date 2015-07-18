include:
  - pi.common.reduce-sd-activity
  - pi.common.rtc.ds3231
  - pi.common.virtualenv
  - pi.common.user

# pi user needs access to the ``dialout`` group
extend:
  pi:
    user.present:
      - groups:
        - dialout
      - require_in:
        - buildout: telstra.mobile

telstra.mobile:
  git.latest:
    - name: https://github.com/davidjb/telstra.mobile.git
    - target: /home/pi/telstra.mobile
    - user: pi
    - submodules: true
  virtualenv.managed:
    - name: /home/pi/telstra.mobile
    - distribute: false
    - user: pi
    - require:
      - pkg: virtualenv
      - git: telstra.mobile
  cmd.run:
    - name: /home/pi/telstra.mobile/bin/pip install -U setuptools
    - user: pi
    - require:
      - virtualenv: telstra.mobile
  # TODO This won't work with new bootstrap-buildout.py scripts
  buildout.installed:
    - name: /home/pi/telstra.mobile
    - python: /home/pi/telstra.mobile/bin/python
    - user: pi
    - require:
      - cmd: telstra.mobile
    - watch:
      - git: telstra.mobile


# Specific script install for daily operation
/etc/cron.daily/send-credit:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - contents_pillar: 'send-credit'
    - require:
      - buildout: telstra.mobile

# Customise crontab and bring times closer together
custom /etc/crontab:
  file.managed:
    - name: /etc/crontab
    - source: salt://pi/templates/crontab
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/cron.daily/send-credit
