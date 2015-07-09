base packages:
  pkg.installed:
    - pkgs:
      - vim
      - tmux
      - imagemagick



python3:
  pkg:
    - installed

python3-pip:
  pkg.installed:
    - require:
      - pkg: python3

virtualenv install:
  cmd.run:
    - name: pip-3.2 install virtualenv
    - require:
      - pkg: python3-pip

cifs-utils:
  pkg:
    - installed

/etc/cifspasswd:
  file.managed:
    - user: root
    - group: root
    - permissions: 400
    - template: jinja
    - context:
