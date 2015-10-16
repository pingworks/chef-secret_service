#
# Cookbook Name:: secret_service
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'vim'

# installs all ssc cmd line tools
include_recipe 'secret_service::secret_service_client'

# call this to fetch secrets from secret service server and store them in the local
# secret service repo (/var/lib/secret-service)
# btw.: This recipe simply calls the cmdline tool ssc-fetch-secrets.
include_recipe 'secret_service::fetch_secrets'

# ==========================
# = Utils                  =
# ==========================
# enable this to mock a secret_service-server
# include_recipe 'secret_service::_mock_secret_service_server_repo'

# if you need an email list of all users stored in a secret service server domain, use this one:
# include_recipe 'secret_service::generate_email_list'

# enable this to bootstrap a new secret_service-server repo
# include_recipe 'secret_service::bootstrap_secret_service_server_repo'
