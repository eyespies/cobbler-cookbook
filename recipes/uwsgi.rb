# rubocop:disable Style/SymbolArray
#
# Cookbook:: cobblerd
# Recipe:: uwsgi
#
# Copyright:: 2017, Specialty Manufacturing Company of South Carolina, All Rights Reserved
package 'uwsgi'

# TODO: Upgrade to Python 3.x? Example output (extraneous listings removed):
# [root@cobbler-prod-01  ~] :) yum list | grep ^uwsgi-plugin-python
# uwsgi-plugin-python2.x86_64          2.0.17.1-1.el7          @epel
# uwsgi-plugin-python34.x86_64         2.0.17.1-1.el7          epel
# uwsgi-plugin-python36.x86_64         2.0.17.1-1.el7          epel
#
package 'uwsgi-plugin-python2'

directory '/etc/uwsgi' do
  owner 'uwsgi'
  group 'uwsgi'
  mode 0o0775
end

template '/etc/uwsgi/cobbler_web.ini' do
  source 'cobbler_web.ini.erb'
  owner 'uwsgi'
  group 'uwsgi'
  mode 0o0664
end

template '/etc/uwsgi/cobbler_svc.ini' do
  source 'cobbler_svc.ini.erb'
  owner 'uwsgi'
  group 'uwsgi'
  mode 0o0664
end

%w[cobbler-web cobbler-svc].each do |svc|
  systemd_unit "#{svc}.service" do
    action :nothing
  end

  template "/lib/systemd/system/#{svc}.service" do
    source "#{svc}.service.erb"
    owner 'root'
    group 'root'
    mode 0o0664
    notifies :reload_or_restart, "systemd_unit[#{svc}.service]", :delayed
  end
end

service 'uwsgi' do
  action [:enable, :start]
end

service 'cobbler-web' do
  action [:enable, :start]
end

service 'cobbler-svc' do
  action [:enable, :start]
end
# rubocop:enable Style/SymbolArray
