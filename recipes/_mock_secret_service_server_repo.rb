#
# Cookbook Name:: secret_service
# Recipe:: _mock_secrets
#
# Copyright (C) 2015 Alexander Birk
#
# Licensed under the Apache License, Version 2.0
#
package 'whois'

# start with a clean slate
directory node['secret_service']['mock']['server']['repo'] do
  recursive true
  action :delete
end

directory node['secret_service']['client']['repo'] do
  recursive true
  action :delete
end

userlist = %w(will nils angelika christian jens sandra eva)
userlist.each do |username|
  directory "#{node['secret_service']['server']['mock']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/.ssh" do
    owner node['secret_service']['client']['user']
    group node['secret_service']['client']['user']
    mode 00700
    recursive true
  end
  bash "Mocking entries for user #{username}" do
    code <<-EOC
      echo #{username} | mkpasswd -s -m sha-512 > #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/password_sha512
      echo #{username} > #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/password
      echo #{username}@example.com > #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/email
      echo "#{username}" > #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/firstname
      echo "#{username}" > #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/lastname
      cp /home/vagrant/.ssh/id_rsa #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/.ssh/id_rsa
      cp /home/vagrant/.ssh/id_rsa.pub #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/.ssh/id_rsa.pub
      cp /home/vagrant/.ssh/id_rsa.pub #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}/user/#{username}/.ssh/authorized_keys
      chown -R #{node['secret_service']['mock']['server']['accessuser']}.#{node['secret_service']['mock']['server']['accessuser']} #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']}
      find #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']} -type d -exec chmod 0700 \\{\\} \\;
      find #{node['secret_service']['mock']['server']['repo']}/#{node['secret_service']['mock']['domain']} -type f -exec chmod 0600 \\{\\} \\;
    EOC
  end
end

directory '/root/.ssh' do
  owner 'root'
  group 'root'
  mode 00700
  action :create
end

cookbook_file '/root/.ssh/authorized_keys' do
  owner 'root'
  group 'root'
  mode 00600
end
