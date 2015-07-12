# Ensure all are mounted as tmpfs for reduction in r/w to SD card
/tmp:
  mount.mounted:
    - device: none
    - fstype: tmpfs
    - opts: defaults
    - dump: 0
    - pass_num: 0

/var/tmp:
  mount.mounted:
    - device: none
    - fstype: tmpfs
    - opts: defaults
    - dump: 0
    - pass_num: 0

/var/log:
  mount.mounted:
    - device: none
    - fstype: tmpfs
    - opts: defaults
    - dump: 0
    - pass_num: 0
