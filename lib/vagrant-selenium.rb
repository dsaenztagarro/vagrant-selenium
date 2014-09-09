module VagrantPlugins
  module Selenium
    class Plugin < Vagrant.plugin('2')
      name 'vagrant-selenium'

      def self.source_root
        @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end

      config 'selenium' do
        require_relative 'vagrant-selenium/config'
        Config
      end

      action_hook(:selenium, :machine_action_up) do |hook|
        require 'vagrant-selenium/action'
        hook.after(Vagrant::Action::Builtin::Provision, Action.install_all)
      end

      action_hook(:selenium, :machine_action_down) do |hook|
        require 'vagrant-selenium/action'
        hook.prepend(Action.stop_server)
      end

      command 'selenium-server' do
        require_relative 'vagrant-selenium/command'
        Command
      end

      I18n.load_path << File.expand_path('locales/en.yml', source_root)
      I18n.reload!
    end
  end
end
