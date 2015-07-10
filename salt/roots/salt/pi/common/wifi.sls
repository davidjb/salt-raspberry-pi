include:
  - .network

wifi firmware:
  pkg.installed:
    - sources:
      - firmware-realtek: http://http.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-realtek_0.43_all.deb
    - require_in:
      - file: /etc/network/interfaces
