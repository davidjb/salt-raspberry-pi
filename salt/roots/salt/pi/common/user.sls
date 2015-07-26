{% for user, config in pillar.get('users', {'pi': {}, 'root': {}}).items() %}
{{ user }}:
  user.present:
    - empty_password: true
    - groups:
      - {{ user }}
      {% for group in config.get('groups') %}
      - {{ group }}
      {% endfor %}
{% endfor %}
