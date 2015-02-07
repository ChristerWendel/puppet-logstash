require 'spec_helper'

describe 'logstash', :type => :class do
  let(:title) { 'logstash::service' }

  context 'with default parameters' do
    it { should contain_service('logstash')
        .with_ensure('running')
        .with_enable('true')
    }
  end

  context 'enable => false' do
    let(:params) { {:enable => 'false'} }

    it { should contain_service('logstash')
        .with_ensure('running')
        .with_enable('false')
    }
  end

  context 'start => false' do
    let(:params) { {:start => 'false'} }

    it { should contain_service('logstash')
        .with_ensure('stopped')
        .with_enable('true')
    }
  end
end
