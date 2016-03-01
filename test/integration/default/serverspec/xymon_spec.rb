require 'spec_helper'

describe package('xymon-client') do
  it { should be_installed }
end

if %w(debian ubuntu).include? os[:family]
  describe package('hobbit-plugins') do
    it { should be_installed }
  end
end

app_name = 'xymon'
app_name = 'hobbit' if %w(debian ubuntu).include?(os[:family]) && os[:release].to_i < 14
service_name = "#{app_name}-client"
if %w(debian ubuntu).include? os[:family]
  config_file = "/etc/default/#{service_name}"
else
  config_file = "/etc/sysconfig/#{service_name}"
end

describe service(service_name) do
  it { should be_running }
  it { should be_enabled }
end

describe file(config_file) do
  it { should exist }
  its(:content) { should match(/SERVERS="server1\s+server2"/) }
  its(:content) { should match(/CLIENTHOSTNAME="#{(`hostname`.chomp)}"/) }
end
