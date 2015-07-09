wifi firmware:
  pkg.installed:
    - sources:
      - firmware-realtek: http://http.us.debian.org/debian/pool/non-free/f/firmware-nonfree/firmware-realtek_0.43_all.deb

/etc/network/interfaces:
  file.managed:
    - source: salt://pi/common/templates/interfaces.jinja
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - context:
      interfaces: {{ pillar.network.get('interfaces', {}) }}

reconfigure networking:
  service.running:
    - name: networking
    - enable: True
    - watch:
      - file: /etc/network/interfaces
