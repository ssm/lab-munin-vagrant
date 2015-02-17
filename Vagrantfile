# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.r10k.puppet_dir = 'puppet'
  config.r10k.puppetfile_path = 'puppet/Puppetfile'

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = [ 'puppet/modules', 'puppet/design' ]
  end

  config.vm.network 'forwarded_port', guest: 80, host: 7188
end
