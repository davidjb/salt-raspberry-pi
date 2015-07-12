include:
  - pi.common
  - pi.common.timezone
  - pi.common.locale
  - pi.common.openssh
  - pi.common.editor
  - pi.common.reduce-sd-activity
  - pi.common.rtc.ds3231
  - pi.common.wifi


telstra.mobile:
  git.latest:
    - name: https://github.com/davidjb/telstra.mobile.git
    - target: /home/pi/telstra.mobile
    - user: pi
    - submodules: true

# Specific Script install
# Crontab.daily entry
