[hostname] configuration
========================

This is a template for Salt-SSH. Add Salt states for configuration of your
targets and adjust this readme accordingly.

Features
--------

* Add your features here.

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
