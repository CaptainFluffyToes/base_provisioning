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
  installs = ['open-vm-tools', 'curl', 'git', 'dbus']
  installs.each do |install|
    package install do
      action :install
    end
  end
  if node['machinename'] !~ /([.]solsys.com)/
    bash 'set_hostname' do
      code <<-EOH
      hostname_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
      hostname_suffix=solsys.com
      hostname=$hostname_string.$hostname_suffix
      hostnamectl set-hostname $hostname
      sed -i "/127.0.1.1 / s/.*/127.0.1.1 $hostname/" /etc/hosts
      /etc/init.d/hostname.sh start
      EOH
      action :run
    end
  end
  if (cat /etc/network/interfaces | awk '/iface eth0 inet/{print $4}') == "dhcp"
    bash 'getFreeIPAddress' do
      code <<-EOH
      ipaddress=$(ifconfig | awk 'FNR==2' | awk '/inet/ {print $2}' | tr -d addr:)
      broadcast=$($ipaddress | sed -e 's/\.[^.]*$//'
      testaddress=1
      run=$true
      while [ $run == $true]; do
        $result=$(ping $broadcast.$testaddress -c 1)
        if [[ $result =~ "Destination Host Unreachable" ]]
        then
          run=$false
          newaddress=$broadcast.$testaddress
        else
          let testaddress++
        fi
      done
      EOH
      action :run
    end
  end
end
