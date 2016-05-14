include:
  - pi.common.i2c
  - pi.common.rtc.ds3231
  - pi.common.python
  - pi.common.virtualenv

libi2c-dev:
  pkg:
    - installed

libffi-dev:
  pkg:
    - installed

RTC_SDL_DS3231:
  git.latest:
    - name: https://github.com/davidjb/RTC_SDL_DS3231.git
    - target: /home/pi/rtc_sdl_ds3231
    - user: pi
    - require:
      - sls: pi.common.i2c
      - sls: pi.common.rtc.ds3231
      - pkg: libi2c-dev
      - pkg: libffi-dev
  virtualenv.managed:
    - name: /home/pi/rtc_sdl_ds3231
    - distribute: false
    - user: pi
    - require:
      - pkg: virtualenv
      - git: RTC_SDL_DS3231
  pip.installed:
    - name: smbus-cffi
    - bin_env: /home/pi/rtc_sdl_ds3231
    - require:
      - pkg: python-pip
      - virtualenv: RTC_SDL_DS3231
