require 'spec_helper'

#if %w(debian ubuntu).include? os[:family]
#end
['xymon-client', 'hobbit-plugins'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
puts os[:release].split('.')[0]
puts os[:release]

service_name= 'xymon-client'
service_name = 'hobbit-client' if %w(debian ubuntu).include?(os[:family]) && os[:release].to_i < 14

describe service(service_name) do
  it { should be_running }
  it { should be_enabled }
end

describe cron do
  it { should have_entry('0 4 * * * apt-get update -qq > /var/lib/apt/update_output 2>&1 && [ ! -s /var/lib/apt/update_output ] && date -u > /var/lib/apt/update_success') }
end

describe file('/etc/default/hobbit-client') do
  it { should exist }
  its(:content) { should match(/HOBBITSERVERS="server1\s+server2"/) }
end


