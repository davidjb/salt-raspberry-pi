{% for user in pillar.get('users', []) %}
empty password for {{ user }}:
  user.present:
    - name: {{ user['name'] }}
    - empty_password: True
{% endfor %}
