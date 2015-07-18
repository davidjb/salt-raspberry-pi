Todo
====

* Remove ``roots`` symlink once the ``file_roots`` relativity
  issue is fixed: https://github.com/saltstack/salt/issues/14613

* Cleanup ``pi.common.wifi`` package install when Salt 2015.8 is released or
  stable

* Pi and root user password configuration (remove passwords?)

  * There's an issue of ``Permission denied, no authentication information``
    when trying to run the ``pi.common.user`` state with the state ID as
    anything but the user ID (eg "remove password for pi").

* Make salt zcbuildout work with newer versions of buildout and
  bootstrap-buildout.py filenames.

Features
~~~~~~~~

* Automatically enable camera via raspi-config (non-interactive option pull
  requests at
  https://github.com/asb/raspi-config/pulls?utf8=%E2%9C%93&q=is%3Apr+is%3Aopen+camera
  )

* Configuration extracted from @davidjb's existing Pis:

  * Camera Pi
    * Why do we need root access to camera? ``failed to open vchiq instance``

  * OpenSprinkler Pi: ...

* Add states for all other device tree overlays:
  https://github.com/raspberrypi/firmware/tree/master/boot/overlays
  https://www.raspberrypi.org/forums/viewtopic.php?uid=121689&f=29&t=97314




