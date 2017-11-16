default['duoproxy']['host'] = '127.0.0.1'
default['duoproxy']['host_2'] = '127.0.0.2'
default['duoproxy']['service_account_username'] = 'duo'
default['duoproxy']['service_account_password'] = '123456789'
default['duoproxy']['search_dn'] = 'CN=USERS,DC=CONTOSO,DC=COM'
default['duoproxy']['ikey'] = 'PRIVATEKEY123'
default['duoproxy']['skey'] = 'PRIVATEPASS1234!'
default['duoproxy']['api_host'] = 'api-56758764654.duosecurity.com'
default['duoproxy']['install_prefix'] = '/opt'
# Version changelog: https://duo.com/docs/authproxy-notes
default['duoproxy']['version'] = 'latest'
default['duoproxy']['url'] = 'https://dl.duosecurity.com/duoauthproxy-'\
                             "#{node['duoproxy']['version']}-src.tgz"
default['duoproxy']['package_dependencies'] = %w(python-dev libffi-dev libssl-dev)
