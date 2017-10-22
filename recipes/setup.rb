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
	installs = ['sudo', 'open-vm-tools', 'curl', 'git']
	installs.each do |install|
		package install do
			action :install
		end
	end
end