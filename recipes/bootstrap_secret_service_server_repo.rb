#
# Cookbook Name:: secret_service
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

cookbook_file '/tmp/userlist.csv' do
  owner 'root'
  group 'root'
  mode 00600
end

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

# not longer required, preset in workshop-tpl on the secret-service server
# cookbook_file '/tmp/testuser_password'
# cookbook_file '/tmp/testuser_password_sha512'
# cookbook_file '/tmp/testuser_id_rsa'
# cookbook_file '/tmp/testuser_id_rsa.pub'

template '/opt/secret-service/bin/ssc-bootstrap-secret-service-server-repo.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-bootstrap-secret-service-server-repo' do
  to '/opt/secret-service/bin/ssc-bootstrap-secret-service-server-repo.sh'
end

execute 'ssc-bootstrap-secret-service-server-repo'
