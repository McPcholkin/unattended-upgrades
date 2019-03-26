{% from 'unattended-upgrades/map.jinja' import map with context %}

include:
  - unattended-upgrades.install

deploy_50unattended-upgrades_cfg:
  file.managed:
    - name: {{ map.config_unattended }}
    - source: salt://{{ slspath }}/files/50unattended-upgrades.jinja
    - user: root
    - group: root
    - mode: 644 
    - template: jinja
    - context:
      pattern: {{ map.pattern }}
      pattern_custom: {{ map.pattern_custom }}
      blacklist: {{ map.blacklist }}
      auto_fix_interrupted: {{ map.auto_fix_interrupted }}
      minimal_steps: {{ map.minimal_steps }}
      install_on_shutdown: {{ map.install_on_shutdown }}
      email_address: {{ map.email_address }}
      email_only_error: {{ map.email_only_error }}
      remove_unused_dependencies: {{ map.remove_unused_dependencies }}
      auto_reboot: {{ map.auto_reboot }}
      reboot_with_users: {{ map.reboot_with_users }}
      auto_reboot_time: {{ map.auto_reboot_time }}
      dl_limit: {{ map.dl_limit }}
      to_syslog: {{ map.to_syslog }}
      syslog_facility: {{ map.syslog_facility }}


deploy_20auto-upgrades_cfg:
  file.managed:
    - name: {{ map.config_auto.path }}
    - source: salt://{{ slspath }}/files/20auto-upgrades.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      update_package_lists: {{ map.config_auto.update_package_lists }}
      unattended_upgrade: {{ map.config_auto.unattended_upgrade }}
      custom: {{ map.config_auto.custom }}


