Raspberry Pi configuration
==========================

A collection of useful `Salt <http://docs.saltstack.com/>`_ states for
configuring Raspberry Pi devices.  At present, the configuration is
specifically designed for Raspbian, though because Salt is OS-agnostic may
work on other distros.

It also contains an eclectic collection of tools and applications that are
useful for a Pi or just plain fun.

Eventually, the common configuration may be refactored into a separate Git
repository so it can be more easily reused.

Features
--------

Generic
~~~~~~~

* Installs base packages
* Timezone configuration
* Locale configuration
* Editor configuration (EDITOR variable)
* OpenSSH configuration (Git environment variables)
* Configure wifi settings
* CIFS mounts
* Keyboard configuration (US)

Raspberry Pi-specific
~~~~~~~~~~~~~~~~~~~~~

* Raspberry Pi update state (upgrade packages, rpi-update, reboot)
* Raspberry Pi Camera packages and installation
* I2C setup and packages
* DS3231 Real-Time Clock (RTC) configuration
* `PiFM <https://github.com/rm-hull/pifm>`_ installation

Todo
~~~~

Configuration extracted from @davidjb's existing Pis:

* Camera Pi
* Modem Pi
* OpenSprinkler Pi



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
