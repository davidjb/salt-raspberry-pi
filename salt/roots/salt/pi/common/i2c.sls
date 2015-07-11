i2c_dev:
  kmod.present:
    - persist: true

i2c-tools:
  pkg.installed:
    - require:
      - kmod: i2c_dev
