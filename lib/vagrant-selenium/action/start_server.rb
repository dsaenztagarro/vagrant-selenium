require 'vagrant-selenium/util'

module VagrantPlugins
  module Selenium
    module Action
      ##
      # Action class implementation for starting selenium server
      class StartServer
        def initialize(app, env)
          @app = app
          @machine = env[:machine] # Vagrant::Machine
          @env = @machine.env      # Vagrant::Environment
          @provider = @machine.provider_name
          @config = Util.get_config(@env)
          @logger = Log4r::Logger.new('vagrant::selenium::start_server')
        end

        def call(env)
          @logger.info 'Start server init'
          @app.call(env)
          @logger.info 'Start server end'
        end
      end
    end
  end
end
