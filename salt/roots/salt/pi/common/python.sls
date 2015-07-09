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
    - unless: test -x /usr/local/bin/virtualenv-3.2
