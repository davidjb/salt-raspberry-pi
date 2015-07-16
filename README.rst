Raspberry Pi configuration
==========================

A collection of useful `Salt <http://docs.saltstack.com/>`_ states for
configuring Raspberry Pi devices.  At present, the configuration is
specifically designed for Raspbian, though because Salt is OS-agnostic may
work on other distros.

It also contains an eclectic collection of tools and applications that are
useful for a Pi or just plain fun.

Eventually, the common configuration may be refactored into a formula-style,
separate Git repository so it can be more easily reused with Pillar data. If
this interests you, create an issue and let me know!

Features
--------

Generic
~~~~~~~

* ``pi.common``: Installs base packages
* ``pi.common.timezone``: Timezone configuration
* ``pi.common.locale``: Locale configuration
* ``pi.common.editor``:  Editor configuration (EDITOR variable)
* ``pi.common.openssh``: OpenSSH configuration (Git environment variables)
* ``pi.common.wifi``: Configure wifi settings
* ``pi.common.cifs``: CIFS mounts
* ``pi.common.keyboard``: Keyboard configuration (US)
* ``pi.common.rtc``: Real-Time Clock (RTC) configuration
* ``pi.common.reboot``: Reboot the device
* ``pi.common.user``: Remove default passwords from user accounts
* ``pi.common.python-smbus``: Python SMBus packages
* ``pi.common.crontab``: Move the crontab entries closer together in time

Raspberry Pi-specific
~~~~~~~~~~~~~~~~~~~~~

* ``pi.common.update``: Raspberry Pi update state (upgrade packages, rpi-update, reboot)
* ``pi.common.reduce-sd-activity``: Tweak the filesystem for reducing SD card
  r/w cycles
* ``pi.common.camera``: Raspberry Pi Camera packages and installation
* ``pi.common.i2c``: I2C Device Tree overlay, setup and packages
* ``pi.common.rtc``: General configuration for setting up RTCs (disable
  fake-hwclock, enable hwclock etc)
* ``pi.common.rtc.ds3231``: DS3231 Real-Time Clock (RTC) configuration via
  Device Tree overlays
* ``pi.common.usb-power``: Configure USB for maximum current
* ``pi.common.pifm``: `PiFM <https://github.com/rm-hull/pifm>`_ installation


Provisioning targets
--------------------

Provision like so::

   salt-ssh [hostname] state.highstate

Identifiers for this command come from the Salt roster file (``salt/roster``).

Requirements
------------

* Salt 2015.5.4 (or latest ``2015.5`` if this isn't yet released)
* Your *master* (the computer running Salt) must have root-level SSH access to
  the given host via key-based authentication.
* If your host is Debian/Ubuntu, you must have ``certifi`` installed::

     sudo easy_install certifi

Todo
----

* Remove ``roots`` symlink once the ``file_roots`` relativity
  issue is fixed: https://github.com/saltstack/salt/issues/14613
