 # This state configures the base for RTC usage on a Pi.  When configured, this
 # state ensure NTP is functioning and the kernel will now be in "11 minutes
 # mode" (see ``man hwclock`` for details), which copies the system time to the
 # hardware clock every 11 minutes.

# For more details, see:
# http://linux.die.net/man/8/hwclock
# http://www.doxer.org/hwclock-and-11-minute-mode-in-linux/

include:
  - .ntp
  - .reboot

# Disable and remove fake-hwclock service
fake-hwclock removed:
  service.disabled:
    - name: fake-hwclock
  pkg.purged:
    - name: fake-hwclock
    - require:
      - service: fake-hwclock

# Install/enable hwclock
hwclock:
  pkg.installed:
    - name: util-linux
  service.running:
    - name: hwclock.sh
    - enable: true
    - require:
      - pkg: fake-hwclock removed
      - service: ntp
    - watch:
      - pkg: hwclock

# Enable hwclock verbose logging
reconfigure hwclock defaults:
  file.append:
    - name: /etc/default/hwclock
    - text: "VERBOSE=yes"
    - require:
      - pkg: hwclock
    - require_in:
      - service: hwclock

# Configure hwclock to be compatible with our RTC
# Pi RTC cannot be detected by udev
reconfigure hwclock init:
  file.replace:
    - name: /etc/init.d/hwclock.sh
    - pattern: '^(\s*).*udev.*$'
    - repl: '\1if [ 1 -ne 1 ]; then'
    - require:
      - pkg: hwclock
    - require_in:
      - service: hwclock

