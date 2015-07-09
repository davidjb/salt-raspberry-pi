cifs-utils:
  pkg:
    - installed

/etc/cifspasswd:
  file.managed:
    - source: salt://pi/common/templates/cifspasswd.jinja
    - user: root
    - group: root
    - mode: 400
    - template: jinja
    - context:
      credentials: {{ pillar.cifs.get('credentials', {}) }}

{% for mount in pillar.cifs.get('mounts', {}) %}
{{ mount['name'] }}:
  mount.mounted:
    - device: {{ mount['device'] }}
    - fstype: {{ mount['fstype'] }}
    - opts: {{ mount['opts'] }}
    - dump: {{ mount['dump'] }}
    - pass_num: {{ mount['pass_num'] }}
    - persist: true
    - mkmnt: true
    - user: pi
    - require:
      - file: /etc/cifspasswd
      - pkg: cifs-utils
{% endfor %}
