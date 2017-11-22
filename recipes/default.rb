#
# Cookbook:: duoproxy
# Recipe:: default
#
# Copyright:: 2017, Texas A&M University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Array(node['duoproxy']['package_dependencies']).each do |pkg|
  apt_package pkg do
    action :install
  end
end

if !::File.exist?('/opt/duoauthproxy/bin/authproxy')
  ark 'duoauthproxy' do
    url node['duoproxy']['url']
    owner 'root'
    path "#{node['duoproxy']['install_prefix']}/src"
    version node['duoproxy']['version']
    action :put
  end

  execute 'make' do
    cwd "#{node['duoproxy']['install_prefix']}/src/duoauthproxy"
    command 'make'
  end

  execute 'remove installed' do
    command "/bin/rm -rf #{node['duoproxy']['install_prefix']}/duoauthproxy"
    only_if { ::File.exist? ("#{node['duoproxy']['install_prefix']}/duoauthproxy")}
  end

  execute 'install' do
    cwd "#{node['duoproxy']['install_prefix']}/src/duoauthproxy/duoauthproxy-build"
    command "./install --install-dir=#{node['duoproxy']['install_prefix']}/duoauthproxy --service-user=root --create-init-script=yes"
    user 'root'
    action :run
    notifies :restart, 'service[duoauthproxy]'
  end

  # remove source we dropped into /opt/src/duoauthproxy
  execute 'remove install file' do
    command "/bin/rm -rf #{node['duoproxy']['install_prefix']}/src/duoauthproxy"
  end
end

template "#{node['duoproxy']['install_prefix']}/duoauthproxy/conf/authproxy.cfg" do
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
  notifies :restart, 'service[duoauthproxy]'
end

service 'duoauthproxy' do
    action [:enable, :start]
end