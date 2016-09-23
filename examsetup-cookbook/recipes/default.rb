#
# Cookbook Name:: examsetup
# Recipe:: default
# Author: Matias Ozdy
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt::default'
include_recipe 'cron'
include_recipe 'docker'
include_recipe 'examsetup::installs'
include_recipe 'examsetup::createfilesanddirs'
include_recipe 'examsetup::docker'
include_recipe 'examsetup::backups'
