require 'spec_helper'

describe 'moinmoin::wiki', :type => :define do
  let :pre_condition do
    'include moinmoin'
  end

  context 'default settings on a Debian system' do
    let(:facts) { { :osfamily => 'Debian' } }
    let(:title) { 'wiki' }
    let :params do
      {
        :sitename            => 'Wiki',
        :interwikiname       => 'Wiki',
        :data_dir            => '/srv/wiki/data/',
        :data_underlay_dir   => '/srv/wiki/underlay/',
        :httpd_external_auth => false,
      }  
    end

    it { should contain_class('moinmoin::params') }

    it do
      should contain_file('/etc/moin/wiki.py') \
        .with_content(/^    sitename = u'Wiki' # \[Unicode\]$/)
    end
    it do
      should contain_file('/etc/moin/wiki.py') \
        .with_content(/^    interwikiname = u'Wiki' # \[Unicode\]$/)
    end
    it do
      should contain_file('/etc/moin/wiki.py') \
        .with_content(/^    data_dir = '\/srv\/wiki\/data\/'$/)
    end
    it do
      should contain_file('/etc/moin/wiki.py') \
        .with_content(/^    data_underlay_dir = '\/srv\/wiki\/underlay\/'$/)
    end
    it { should contain_file('/srv/wiki/data/') }
    it { should contain_file('/srv/wiki/underlay/') }
  end
end