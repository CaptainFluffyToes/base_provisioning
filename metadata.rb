name 'base_configuration'
maintainer 'Darren Khan'
maintainer_email 'djkhan85@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures base_configuration'
long_description 'Installs/Configures base_configuration'
version '0.2.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/base_configuration/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/base_configuration'

#Changelog
#[10/9/2017] - 0.1.1 - Added the chef-client cookbook
#[10/9/2017] - 0.1.2 - Updated default.rb to include the chef-client attributes
#[10/11/2017] - 0.1.3 - Added setup.rb to the recipe list to install the correct packages
#[10/11/2017] - 0.1.4 - Added bind mount information
#[10/11/2017] - 0.1.5 - Recreated bind mount and updated freenas with the right user groups and file shares
#[10/12/2017] - 0.1.6 - Added creation of the Media directory before the mount
#[10/13/2017] - 0.1.7 - Removed creation of the Media director and the bind mount because this cookbook doesn't need that
#[10/15/2017] - 0.1.7 - Added GIT installation
#[10/16/2017] - 0.1.8 - Added apt-transport-https and updated berksfile with local chef server
#[10/16/2017] - 0.1.9 - Added gnupg2 installation package and other packages needed for basic docker installation
#[10/16/2017] - 0.1.10 - Moved docker installation packages to the docker configuration cookbook
#[10/16/2017] - 0.1.11 - Added apt_update
#[10/16/2017] - 0.2.0 - Removed CIFS installation.
#[10/16/2017] - 0.2.1 - Added https transport before apt update.   

depends 'chef-client'