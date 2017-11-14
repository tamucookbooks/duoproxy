template '/opt/duoproxy-1/conf/authproxy.cfg' do
  source 'default.erb'
  owner 'root'
  group 'root'
  variables(
    host: node['duoproxy']['host'],
    host_2: node['duoproxy']['host_2'],
    service_account_username: node['duoproxy']['service_account_username'],
    service_account_password: node['duoproxy']['service_account_password'],
    search_dn: node['duoproxy']['search_dn'],
    ikey: node['duoproxy']['ikey'],
    skey: node['duoproxy']['skey'],
    api_host: node['duoproxy']['api_host']
  )
end
