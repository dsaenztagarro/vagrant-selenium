module VagrantPlugins
  module Selenium
    class Plugin < Vagrant.plugin('2')
      name 'vagrant-selenium'

      config 'selenium' do
        require_relative 'vagrant-selenium/config'
        Config
      end

      action_hook(:selenium, :machine_action_up) do |hook|
        require_relative 'vagrant-selenium/action/install'
        hook.after(Vagrant::Action::Builtin::Provision, Action::Install)
      end

      action_hook(:selenium, :machine_action_down) do |hook|
        require_relative 'vagrant-selenium/action/stop_server'
        hook.prepend(Action::StopServer)
      end

      command 'selenium-server' do
        require_relative 'vagrant-selenium/command'
        Command
      end

      I18n.load_path << File.expand_path('locales/en.yml', source_root)
      I18n.reload!

      private

      # def self.source_root
      #   @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
      # end
    end
  end
end
