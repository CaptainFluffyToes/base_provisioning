#
# Cookbook:: base_configuration
# Recipe:: default
#
# Copyright:: 2017, Darren Khan, All Rights Reserved.

node.default['chef_client']['interval'] = '300'
node.default['chef_client']['splay'] = '60'

include_recipe 'chef-client::default'
include_recipe 'base_configuration::setup'
