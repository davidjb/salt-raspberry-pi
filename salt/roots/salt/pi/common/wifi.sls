include:
  - .network

# Requires fix from 2015.8 of salt (issue #7772)
{%- set version = '0.43' %}
{%- if salt['cmd.run']("dpkg-query --showformat='${Version}' -W firmware-realtek") != version %}
remove old wifi firmware:
  pkg.removed:
    - name: firmware-realtek
    - require_in:
      - pkg: wifi firmware
{%- endif %}

wifi firmware:
  pkg.installed:
    - sources:
      - firmware-realtek: http://http.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-realtek_0.43_all.deb
    - require_in:
      - file: /etc/network/interfaces
