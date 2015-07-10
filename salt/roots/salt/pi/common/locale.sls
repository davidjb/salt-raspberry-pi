locale present:
  locale.present:
  - name: en_AU.UTF-8

locale default:
  locale.system:
    - name: en_AU.UTF-8
    - require:
      - locale: locale present
