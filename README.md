duoproxy
======================
This cookbook is to install Duoproxy agent for Duo. 
https://duo.com/docs/authproxy_reference

Requirements
-------------
This has been written and tested on Ubuntu-16.04

Attributes
-------------
#### duoproxy::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['duoproxy']['host']</tt></td>
    <td>string</td>
    <td>The hostname or IP address of your domain controller.</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['host_2']</tt></td>
    <td>string</td>
    <td>The hostname or IP address of a secondary/fallback domain controller.</td>
    <td><tt>127.0.0.2</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['service_account_username']</tt></td>
    <td>string</td>
    <td>The username of an account that has permission to read from your Active Directory database</td>
    <td><tt>duo</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['service_account_password']</tt></td>
    <td>string</td>
    <td>The password corresponding to service_account_username.</td>
    <td><tt>12345678</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['search_dn']</tt></td>
    <td>string</td>
    <td>The LDAP distinguished name (DN) of an Active Directory container or organizational unit (OU) containing all of the users you wish to permit to log in.</td>
    <td><tt>CN=USERS,DC=CONTOSO,DC=COM</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['ikey']</tt></td>
    <td>string</td>
    <td>Your Duo integration key.</td>
    <td><tt>PRIVATEKEY123</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['skey']</tt></td>
    <td>string</td>
    <td>Your Duo secret key</td>
    <td><tt>PRIVATEPASS1234!</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['api_host']</tt></td>
    <td>string</td>
    <td>Your Duo API hostname</td>
    <td><tt>api-56758764654.duosecurity.com</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['install_prefix']</tt></td>
    <td>string</td>
    <td>Location of install</td>
    <td><tt>/opt</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['version']</tt></td>
    <td>string</td>
    <td>Version of Duo Proxy to be installed</td>
    <td><tt>latest</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['url']</tt></td>
    <td>string</td>
    <td>URL from where to download the tar file</td>
    <td><tt>https://dl.duosecurity.com/duoauthproxy-'\"#{node['duoproxy']['version']}-src.tgz"</tt></td>
  </tr>
  <tr>
    <td><tt>['duoproxy']['package_dependencies']</tt></td>
    <td>string</td>
    <td>Package dependencies for Ubuntu</td>
    <td><tt>%w(python-dev libffi-dev libssl-dev)</tt></td>
  </tr>
</table>
