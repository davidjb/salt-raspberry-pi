Raspberry Pi configuration
==========================

Features
--------

Done
~~~~

* Timezone configuration
* Configure wifi settings
* Update state (upgrade packages, rpi-update, reboot)
* OpenSSH configuration (Git environment variables)

Todo
~~~~

* Configure base packages
* Configure specific RTC
* Camera packages and installation
* CIFS mounts
* Keyboard configuration

Configuration extracted from:

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

* Salt 2015.5+.
* Your *master* (the computer running Salt) must have root-level SSH access to
  the given host via key-based authentication.
* If your host is Debian/Ubuntu, you must have ``certifi`` installed::

     sudo easy_install certifi

Todo
----

* Remove ``roots`` symlink once the ``file_roots`` relativity
  issue is fixed: https://github.com/saltstack/salt/issues/14613
