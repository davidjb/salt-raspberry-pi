python:
  pkg:
    - installed

# Makes pip_state available
python-pip:
  pkg.installed:
    - require:
      - pkg: python

python3:
  pkg:
    - installed

python3-dev:
  pkg:
    - installed

python3-pip:
  pkg.installed:
    - require:
      - pkg: python3

virtualenv install:
  cmd.run:
    - name: pip3 install virtualenv
    - require:
      - pkg: python3-pip
    - unless: test -x /usr/local/bin/virtualenv-3.2
