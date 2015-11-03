default['secret_service']['domain'] = 'sampleworkshop'
default['secret_service']['accessuser'] = 'secret-admin'
default['secret_service']['accessuserkey'] = '/tmp/id_rsa'
default['secret_service']['server']['host'] = 'belharra.pingworks.net'
default['secret_service']['server']['repo'] = '/var/lib/secret-service-server'

default['secret_service']['client']['user'] = 'root'
default['secret_service']['client']['repo'] = '/var/lib/secret-service'

default['secret_service']['mock']['domain'] = 'sampleworkshop'
default['secret_service']['mock']['accessuser'] = 'root'
default['secret_service']['mock']['accessuserkey'] = '/home/vagrant/.ssh/id_rsa'
default['secret_service']['mock']['server']['host'] = 'localhost'
default['secret_service']['mock']['server']['repo'] = '/var/lib/secret-service-server'
