require 'spec_helper'
describe 'windows_terminal_services' do

  context 'with defaults for all parameters' do
    it { should contain_class('windows_terminal_services') }
  end
end
