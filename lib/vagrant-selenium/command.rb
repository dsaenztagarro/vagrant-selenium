module VagrantPlugins
  module Selenium
    class Command < Vagrant.plugin(2, :command)
      def execute
        puts 'Hello'
        0
      end
    end
  end
end
