template '/opt/duoauthproxy/conf/authproxy.cfg' do 
    source 'authproxy.erb'
    owner 'root'
    group 'root'
    variables({
        :host => '127.0.0.1',
        :host_2 => '127.0.0.2',
        :service_account_username => 'duo',
        :service_account_password => '123456789',
        :search_dn => 'CN=USERS,DC=CONTOSO,DC=COM ',
        :ikey => 'PRIVATEKEY123',
        :skey => 'PRIVATEPASS1234!',
        :api_host => 'api-56758764654.duosecurity.com'
    })
end
