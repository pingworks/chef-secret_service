#
# Cookbook Name:: secret_service
# Recipe:: _mock_secrets
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#

userlist = %w(testuser)
userlist.each do |username|
  directory "#{node['secret_service']['client']['repo']}/user/#{username}/.ssh" do
    owner node['secret_service']['client']['user']
    group node['secret_service']['client']['user']
    mode 00700
    recursive true
  end

  cookbook_file "#{node['secret_service']['client']['repo']}/user/#{username}/.ssh/id_rsa" do
    source 'vagrant_id_rsa'
    owner node['secret_service']['client']['user']
    group node['secret_service']['client']['user']
    mode 00600
  end

  cookbook_file "#{node['secret_service']['client']['repo']}/user/#{username}/.ssh/id_rsa.pub" do
    source 'vagrant_id_rsa.pub'
    owner node['secret_service']['client']['user']
    group node['secret_service']['client']['user']
    mode 00600
  end

  cookbook_file "#{node['secret_service']['client']['repo']}/user/#{username}/.ssh/authorized_keys" do
    source 'vagrant_id_rsa.pub'
    owner node['secret_service']['client']['user']
    group node['secret_service']['client']['user']
    mode 00600
  end

  cookbook_file "#{node['secret_service']['client']['repo']}/user/#{username}/password_sha512" do
    source 'testuser_password_hash'
    owner 'root'
    group 'root'
    mode 00644
  end

  bash "Mocking secrets for user #{username}" do
    code <<-EOC
      echo #{username}@example.com > #{node['secret_service']['client']['repo']}/user/#{username}/email
      echo "#{username}" > #{node['secret_service']['client']['repo']}/user/#{username}/firstname
      echo "#{username}" > #{node['secret_service']['client']['repo']}/user/#{username}/lastname
      chown -R #{node['secret_service']['client']['user']}.#{node['secret_service']['client']['user']} #{node['secret_service']['client']['repo']}
      find #{node['secret_service']['client']['repo']} -type d -exec chmod 0700 \\{\\} \\;
      find #{node['secret_service']['client']['repo']} -type f -exec chmod 0600 \\{\\} \\;
    EOC
  end
end
