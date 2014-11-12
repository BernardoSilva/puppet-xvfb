require 'spec_helper'
describe 'xvfb' do

  context 'with defaults for all parameters' do
    it { should contain_class('xvfb') }
  end
end
