{% set is_development = 'development' in grains.get('roles', ()) %}
pillar:
  configuration:
    goes:
      - here
      - or
      - anywhere in this folder
