i2c_dev:
  kmod.present:
    - persist: true

i2c-tools:
  pkg.installed:
    - require:
      - kmod: i2c_dev

# Enable the DS3231 RTC using Device Tree Overlays
i2c enabled:
  file.append:
    - name: /boot/config.txt
    - text: "dtparam=i2c_arm=on"
