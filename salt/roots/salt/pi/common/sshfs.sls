include:
  - pi.common.ssh

sshfs:
  pkg.installed

{% for mount in pillar.get('sshfs', {}).get('mounts', {}) %}
{{ mount['name'] }}:
  mount.mounted:
    - device: {{ mount['device'] }}
    - fstype: {{ mount['fstype'] }}
    - opts: {{ mount['opts'] }}
    - dump: {{ mount['dump'] }}
    - pass_num: {{ mount['pass_num'] }}
    - persist: true
    - mkmnt: true
    - require:
      - cmd: ssh key
      - pkg: sshfs
{% endfor %}
