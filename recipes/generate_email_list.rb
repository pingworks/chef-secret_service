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

template '/opt/secret_service/bin/ssc-generate-email-list.sh' do
  owner 'root'
  group 'root'
  mode 00755
end

link '/usr/local/bin/ssc-generate-email-list' do
  to '/opt/secret_service/bin/ssc-generate-email-list.sh'
end
