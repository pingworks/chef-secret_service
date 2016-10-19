#
# Cookbook Name:: secret_service
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

package 'pwgen'

cookbook_file '/tmp/id_rsa' do
  owner 'root'
  group 'root'
  mode 00600
end

directory '/opt/secret_service/bin' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

template '/opt/secret_service/bin/ssc-print-loginlist.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-print-loginlist' do
  to '/opt/secret_service/bin/ssc-print-loginlist.sh'
end

bash 'call scc-print-loginlist' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  bash /opt/secret_service/bin/ssc-print-loginlist.sh
  EOH
end
