pi:
  user.present:
    - empty_password: true
    - groups:
      - pi

root:
  user.present:
    - empty_password: true
    - groups:
      - root
