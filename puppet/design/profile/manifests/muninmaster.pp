class profile::muninmaster {
  class { 'munin::master':
    graph_strategy => 'cron',
    html_strategy  => 'cron',
    collect_nodes  => 'disabled',
  }

  class { 'munin::node':
    host_name   => 'munin.example.com',
    export_node => 'disabled',
  }

  munin::master::node_definition { 'munin.example.com':
    address => '[::1]'
  }

  exec { 'munin-cron':
    command => '/usr/bin/sudo -u munin /usr/bin/munin-cron',
    creates => '/var/lib/munin/datafile',
    require => [ Class['munin::master'], Class['munin::node'] ],
  }

}

