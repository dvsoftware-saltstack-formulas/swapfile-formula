{% from "swapfile/map.jinja" import conf with context %}

{{ conf.swapfile }}|create_swap:
  cmd.run:
    - name: {{ conf.name }}
    - unless: test -f {{ conf.swapfile }}

{{ conf.swapfile }}|mount_swap:
  mount.swap:
    - name: {{ conf.swapfile }}
    - persist: true
    - require:
      - cmd: {{ conf.swapfile }}|create_swap
