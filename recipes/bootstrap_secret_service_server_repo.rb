#
# Cookbook Name:: secret_service
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

package 'pwgen'
package 'whois'
package 'rsync'

directory '/opt/secret-service/bin' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

cookbook_file '/tmp/id_rsa' do
  owner 'root'
  group 'root'
  mode 00600
end

cookbook_file '/tmp/userlist.csv' do
  owner 'root'
  group 'root'
  mode 00600
end

template '/opt/secret-service/bin/ssc-bootstrap-secret-service-server-repo.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-bootstrap-secret-service-server-repo' do
  to '/opt/secret-service/bin/ssc-bootstrap-secret-service-server-repo.sh'
end

execute 'ssc-bootstrap-secret-service-server-repo'
