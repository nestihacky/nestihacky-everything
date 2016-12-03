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
    }

    # ansible.tags = ["dmarc"]
    # ansible.skip_tags = ["firewalld"]
    ansible.verbose = "v"
  end

  if Vagrant.has_plugin? "vagrant-hostmanager"
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
  end

  config.vm.define "centos", primary: true do |centos|
    centos.vm.box = "centos/7"
  end
end
