{% from 'unattended-upgrades/map.jinja' import map with context %}

install_unattended-upgrades:
  pkg.installed:
    - pkgs: {{ map.pkgs }}
  service.running:
    - enable: True
    - restart: True
    - name: {{ map.service }}
    - require:
      - pkg: install_unattended-upgrades

