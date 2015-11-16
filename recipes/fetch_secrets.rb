#
# Cookbook Name:: secret_service
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

cookbook_file '/tmp/id_rsa' do
  owner 'root'
  group 'root'
  mode 00600
end

directory '/etc/workshopbox' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

template '/etc/workshopbox/workshop_name'
cookbook_file '/etc/workshopbox/workshop_domainkey'

execute 'ssc-fetch-secrets'
