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

execute 'ssc-fetch-secrets'
