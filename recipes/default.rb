#
# Cookbook:: base_configuration
# Recipe:: default
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

node.default['chef_client']['interval'] = '900'
node.default['chef_client']['splay'] = '900'

include_recipe 'chef-client::default'
include_recipe 'base_configuration::setup'
