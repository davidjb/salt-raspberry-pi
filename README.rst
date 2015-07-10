Raspberry Pi configuration
==========================

Features
--------

Done
~~~~

* Timezone configuration
* Locale configuration
* Configure wifi settings
* Update state (upgrade packages, rpi-update, reboot)
* OpenSSH configuration (Git environment variables)
* CIFS mounts
* Camera packages and installation
* Keyboard configuration (US)

Todo
~~~~

* Configure base packages
* Configure specific RTC

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
