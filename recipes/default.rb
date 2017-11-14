#
# Cookbook:: duoproxy
# Recipe:: default
#
# Copyright:: 2017, Laura Melton
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

apt_package 'python-dev' do
  action :install
end

ark 'duoproxy' do
  url 'https://dl.duosecurity.com/duoauthproxy-latest-src.tgz'
  owner 'root'
  prefix_root '/opt'
  prefix_home '/opt'
  prefix_bin '/opt/bin'
  action :install
end

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
