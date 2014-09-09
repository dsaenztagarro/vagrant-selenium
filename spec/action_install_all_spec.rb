require 'spec_helper'

describe VagrantPlugins::Selenium::Action::InstallAll do
  let(:app) { double(call: true) }
  let(:state) { double(id: :poweron) }
  let(:cmd) { 'cmd' }
  let(:sh) { double(after_share_folders: cmd) }
  let(:config) { double(sh: sh) }
  let(:machine_env) { double(config: config, state: state, action: true) }
  let(:action_env) { { machine: machine_env } }
  let(:env) { double(:[] => machine_env) }
  let(:subject) { described_class.new(app, env) }

  describe '#call' do
    it 'should call the next middleware' do
      expect(app).to receive(:call).with(action_env)

      subject.call(action_env)
    end
  end
end
