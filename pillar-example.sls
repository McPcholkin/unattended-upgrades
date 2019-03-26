unattended-upgrades:
  email_address: 'admin@example.com'
  auto_reboot: False
  pattern_custom: 
    - 'origin=TorProject'
  config_auto:
    custom:
      - 'APT::Periodic::AutocleanInterval "5"'
      - 'APT::Periodic::Verbose "1"'
