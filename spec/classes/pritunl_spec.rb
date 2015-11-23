require 'spec_helper'

describe 'pritunl' do
  let(:facts) { default_test_facts }

  context 'ensure => present' do
    let(:params) { { :ensure => 'present' } }

    it do
      should contain_package('pritunl-0.10.14').with({
        :ensure   => 'present',
        :source   => '/tmp/Pritunl-0.10.14.pkg',
        :provider => 'pkgdmg',
        :install_options => ['--appdir=/Applications', '--binarydir=/test/boxen/bin'],
      })
    end
  end

  context 'ensure => absent' do
    let(:params) { { :ensure => 'absent' } }

    it { should contain_package('pritunl-0.10.14').with_ensure('absent') }
  end

end
