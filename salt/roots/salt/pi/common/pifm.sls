pifm source:
  git.latest:
    - name: https://github.com/rm-hull/pifm.git
    - target: /home/pi/pifm
    - user: pi
    - submodules: true

make pifm:
  cmd.wait:
    - name: make
    - cwd: /home/pi/pifm
    - runas: pi
    - watch:
      - git: pifm source
