Vagrant.configure("2") do |config|
  config.vm.hostname = "nestihacky.local"
  config.vm.network "private_network", ip: "172.17.66.6"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "plays/site.yml"
    ansible.host_key_checking = false
    ansible.extra_vars = "group_vars/vagrant"
    ansible.groups = {
      "vagrant" => ["centos"],
      "git:children" => ["vagrant"],
      "limnoria:children" => ["vagrant"],
      "mailserver:children" => ["vagrant"],
      "mailman:children" => ["vagrant"],
      "pagure:children" => ["vagrant"],
      "sniproxy:children" => ["vagrant"],
      "letsencrypt:children" => ["vagrant"],
      "graphite:children" => ["vagrant"],
      "moin:children" => ["vagrant"],
    }

    # ansible.tags = ["dmarc"]
    # ansible.skip_tags = ["firewalld"]
    ansible.verbose = "v"
  end

  if Vagrant.has_plugin? "vagrant-libvirt"
    config.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
      domain.nested = true
      domain.volume_cache = 'none'
    end
  end

  if Vagrant.has_plugin? "vagrant-hostmanager"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  end

#  config.vm.define "fedora", primary: true do |fedora|
#    fedora.vm.box = "fedora/25-cloud-base"
#  end
  config.vm.define "centos", primary: true do |centos|
    centos.vm.box = "centos/7"
  end
end
