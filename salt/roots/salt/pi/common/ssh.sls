ssh key:
  cmd.run:
    - name: ssh-keygen -q -b 4096 -N '' -f /home/pi/.ssh/id_rsa
    - runas: pi
    - unless: test -f /home/pi/.ssh/id_rsa
