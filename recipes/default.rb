#
# Cookbook:: duo
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

tar_package 'https://dl.duosecurity.com/duoauthproxy-latest-src.tgz' do 
    prefix '/var/duo'
    creates '/var/duo/duoauthproxy-version-src'
end

include_recipe 'duoproxy::config_edit'

