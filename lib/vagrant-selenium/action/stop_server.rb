require 'vagrant-selenium/util'

module VagrantPlugins
  module Selenium
    module Action
      ##
      # Action class implementation for stopping selenium server once the
      # vagrant machine is stopped
      class StopServer
        def initialize(app, env)
          @app = app
          @machine = env[:machine] # Vagrant::Machine
          @env = @machine.env      # Vagrant::Environment
          @provider = @machine.provider_name
          @config = Util.get_config(@env)
          @logger = Log4r::Logger.new('vagrant::selenium::stop_server')
        end

        def call(env)
          @logger.info 'Stop server init'
          @app.call(env)
          @logger.info 'Stop server end'
        end
      end
    end
  end
end
