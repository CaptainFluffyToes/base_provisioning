#
# Cookbook:: base_configuration
# Recipe:: default
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

node.default['chef_client']['interval'] = '900'
node.default['chef_client']['splay'] = '900'
node.default['chef_client']['config']['chef_server_url'] = 'https://Chef-Master.solsys.com/organizations/solsys'
node.default['chef_client']['config']['ssl_verify_mode'] = 'none'

include_recipe 'chef-client::default'
include_recipe 'base_configuration::setup'
