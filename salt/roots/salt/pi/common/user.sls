{% for user in pillar.get('users', []) %}
{# Adding extra text to the unique ID breaks the run #}
{{ user['name'] }}:
  user.present:
    - empty_password: true
{% endfor %}
