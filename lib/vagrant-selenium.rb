module VagrantPlugins
  module Selenium
    class Plugin < Vagrant.plugin('2')
      name 'vagrant-selenium'

      config 'selenium' do
        require_relative 'vagrant-selenium/config'
        Config
      end

      action_hook(:selenium, :machine_action_up) do |hook|
        require_relative 'vagrant-selenium/install_selenium'
        hook.after(Vagrant::Action::Builtin::Provision, Action.install_all)
      end

      action_hook(:selenium, :machine_action_destroy) do |hook|
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
