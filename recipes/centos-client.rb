service_name = 'xymon-client'

include_recipe 'yum-epel'

major_version = node['platform_version'].split('.')[0] 
yum_repository 'xymon' do
  description 'Xymon Software Builds'
  baseurl "http://terabithia.org/rpms/xymon/el#{major_version}/"
  gpgkey 'http://terabithia.org/rpms/RPM-GPG-KEY-JCLEAVER'
  action :create
end

package 'lz4' do
  action :install
end

package 'xymon-client' do
  action :install
end

template "/etc/sysconfig/#{service_name}" do
  source "#{service_name}.erb"
  mode '0644'
  notifies :restart, "service[#{service_name}]"
end

service service_name do
  supports :restart => true, :reload => true, :status => true
  action [:enable, :start]
end

