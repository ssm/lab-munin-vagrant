class profile::webserver {
  package { 'nginx':
    ensure => installed,
  }
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('profile/webserver/default-vhost'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}
