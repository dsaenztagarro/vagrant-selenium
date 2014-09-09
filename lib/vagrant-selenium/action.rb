require 'vagrant-selenium/action/start_server'
require 'vagrant-selenium/action/stop_server'
require 'vagrant-selenium/action/update_server'
require 'vagrant-selenium/action/update_web_browser'

module VagrantPlugins
  module Selenium
    module Action
      include Vagrant::Action::Builtin

      def self.update_all
        Vagrant::Action::Builder.new.tap do |builder|
          builder.use UpdateServer
          builder.use UpdateWebBrowser
          builder.use StartServer
        end
      end

      def self.stop_server
        Vagrant::Action::Builder.new.tap do |builder|
          builder.use StopServer
        end
      end
    end
  end
end
