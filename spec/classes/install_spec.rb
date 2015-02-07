require 'spec_helper'

describe 'logstash', :type => :class do
  let(:title) { 'logstash::install' }

  context 'with default parameters' do
    it { should contain_aptrepo__addrepo('logstash')
        .with_location('http://packages.elasticsearch.org/logstash/1.4/debian/')
        .with_key('http://packages.elasticsearch.org/GPG-KEY-elasticsearch')
    }

    it { should contain_package('logstash')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('logstash')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('logstash')
        .with_ensure('latest')
    }
  end
end
