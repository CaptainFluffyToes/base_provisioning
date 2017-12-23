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

if node['hostname'] !~ /([.]solsys.com)/
  bash 'set_hostname' do
    code <<-EOH
    hostname_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)
    hostname_suffix=solsys.com
    hostname=$hostname_string.$hostname_suffix
    hostnamectl set-hostname $hostname
    sed -i -e "s/core/$hostname/g" /etc/hosts
    /etc/init.d/hostname.sh start
    EOH
    action :run
  end
end

ohai 'update_information' do
  action :reload
end
