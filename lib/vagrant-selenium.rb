module VagrantPlugins
  module Selenium
    class Plugin < Vagrant.plugin("2")
      name "vagrant-selenium"
      command "selenium-server" do
        require_relative "vagrant-selenium/command"
        Command
      end
    end
  end
end
