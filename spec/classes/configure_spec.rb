require 'spec_helper'

describe 'logstash', :type => :class do
  let(:title) { 'logstash::configure' }

  context 'with default parameters' do
    it { should contain_file('/etc/logstash/conf.d/syslog.conf')
        .with_ensure('present')
        .with_owner('logstash')
        .with_group('logstash')
        .with_mode('0644')
        .with_content(/input {/)
    }

    it { should contain_file('/etc/logstash/conf.d/elasticsearch.conf')
        .with_ensure('present')
        .with_owner('logstash')
        .with_group('logstash')
        .with_mode('0644')
        .with_content(/output {/)
        .with_content(/host => 'localhost'/)
    }

    it { should contain_user('logstash')
        .with_ensure('present')
        .with_groups(['logstash', 'adm'])
    }
  end

  context 'elasticsearch_host => remote' do
    let (:params) { { :elasticsearch_host => 'remote' } }

    it { should contain_file('/etc/logstash/conf.d/elasticsearch.conf')
        .with_content(/host => 'remote'/)
    }
  end
end
