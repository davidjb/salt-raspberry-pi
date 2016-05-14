include:
  - pi.common.reduce-sd-activity
  - pi.common.user
  - pi.common.python-ds3231
  - pi.gsmmodem

requests:
  pip.installed:
    - bin_env: /home/pi/rtc_sdl_ds3231
    - require:
      - pkg: python-pip
      - virtualenv: RTC_SDL_DS3231

/home/pi/rtc_sdl_ds3231/thingspeak-temp.py:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - contents_pillar: 'thingspeak-temp.py'
    - require:
      - pip: RTC_SDL_DS3231
      - pip: requests

# RUn the sensor script every 15 minutes
thingspeak crontab entry:
  file.append:
    - name: /etc/crontab
    - text: "*/15 * * * * root /home/pi/rtc_sdl_ds3231/bin/python /home/pi/rtc_sdl_ds3231/thingspeak-temp.py"
    - require:
      - file: custom /etc/crontab
      - file: /home/pi/rtc_sdl_ds3231/thingspeak-temp.py
