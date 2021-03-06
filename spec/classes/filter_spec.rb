require 'spec_helper'

describe 'tinyproxy::filter', :type => :class do
  context 'config white filter' do
    let(:facts) { { :osfamily => 'Debian' } }
    let(:pre_condition) {
      'class { "::tinyproxy":
        filter_default_deny => true,
        filter_file         => "/etc/tinyproxy/tinyproxy_filter.conf",
        filter_extended     => true,
      }'
    }
    let(:params) {{ :filters => ['^apt\.puppetlabs\.com$'] }}
    it { should contain_file('/etc/tinyproxy/tinyproxy_filter.conf') }
  end
end