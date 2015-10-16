#
# Cookbook Name:: secret_service
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

package 'rsync'

directory '/opt/secret-service/bin' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

template '/opt/secret-service/bin/ssc-fetch-secrets.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-fetch-secrets' do
  to '/opt/secret-service/bin/ssc-fetch-secrets.sh'
end

template '/opt/secret-service/bin/ssc-list-users.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-list-users' do
  to '/opt/secret-service/bin/ssc-list-users.sh'
end
