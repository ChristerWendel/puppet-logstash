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
        .with_content(/hosts => \[\"localhost:9200\"\]/)
    }

    it { should contain_user('logstash')
        .with_ensure('present')
        .with_groups(['logstash', 'adm'])
    }
  end

  context 'elasticsearch_hosts => [localhost, other_host]' do
    let(:params) do
      { :elasticsearch_hosts => ['localhost', 'other_host'],
      }
    end

    it { should contain_file('/etc/logstash/conf.d/elasticsearch.conf')
        .with_ensure('present')
        .with_owner('logstash')
        .with_group('logstash')
        .with_mode('0644')
        .with_content(/output {/)
        .with_content(/hosts => \[\"localhost:9200\", \"other_host:9200\"\]/)
    }
  end
end
