require 'spec_helper'

describe VagrantPlugins::Selenium::Command do
  let(:subject) { described_class.new('2', 'command') }

  before(:each) do
    VagrantPlugins::Selenium::OptionManager.stub_chain(:new, :execute)
  end

  describe '#execute' do
    it 'returns 0 if all went good' do
      expect(subject.execute).to eql(0)
    end
  end
end
