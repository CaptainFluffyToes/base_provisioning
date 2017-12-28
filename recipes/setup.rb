#
# Cookbook:: base_configuration
# Recipe:: setup.rb
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

if node['platform'] == 'debian'
  installs = ['apt-transport-https']
  installs.each do |install|
    package install do
      action :install
    end
  end
  apt_update 'Update Apt' do
    action :update
  end
  installs = ['sudo', 'open-vm-tools', 'curl', 'git', 'dbus']
  installs.each do |install|
    package install do
      action :install
    end
  end
end

if node['machinename'] !~ /([.]solsys.com)/
  bash 'set_hostname' do
    code <<-EOH
    hostname_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
    hostname_suffix=solsys.com
    hostname=$hostname_string.$hostname_suffix
    hostnamectl set-hostname $hostname
    awk '/127.0.1.1/ {$2="$hostname"}1' /etc/hosts
    /etc/init.d/hostname.sh start
    EOH
    action :run
  end
end
