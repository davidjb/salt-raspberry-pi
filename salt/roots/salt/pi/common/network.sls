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
