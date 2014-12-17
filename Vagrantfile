# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'ubuntu/trusty64'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network 'forwarded_port', guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Set the version of chef to install using the vagrant-omnibus plugin
  # NOTE: You will need to install the vagrant-omnibus plugin:
  #
  #   $ vagrant plugin install vagrant-omnibus
  #
  if Vagrant.has_plugin? 'vagrant-omnibus'
    config.omnibus.chef_version = 'latest'
  end

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = './Berksfile'

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'packing_tape::default'

    chef.json = {
      user: {
        password: '$1$AQUsDVGX$lgxMPGdyMW6HMp6ruBYdS.',
        ssh_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsNR7Iwc36JVXtNxh+CvG5oW4cFEe4PbmRJ/2XJWBxcjKZ43a9zJ2RzGGo/Uo4gk+Jr+qGPRWCjwIdVx4C+v/u7gLqsCRT/uNxmq63+AoFeKJo+YvHJ3sLxB/SkxgTgsDhEU7i9Y14CnAIzRq1GBFaJzWV+dj6tif4pDbhrsnzPYXUd/dKp7sAH/2WX50zH4qigvEl8PnqJxCc0nnnIhOqgY+T5craZRaLYAQGxVlapVCKT1YX94bL+aaWLvGTyW4JCp/jc3nN8ckY4w3Cu34mA/xP4+6N7+pKgPonzUq798ghxilDNX+s2xnUWIaJWwVNKBIqzLrhf31nPYnjGfpf leonelgalan@gmail.com'
      },
      app: {
        name: 'chef_capistrano',
        rails_env: 'development'
      }
    }
  end
end
