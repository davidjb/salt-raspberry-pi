vim:
  pkg.installed

editor environment variable:
  file.append:
    - name: /etc/bash.bashrc
    - text: export EDITOR=vim
    - require:
      - pkg: vim

