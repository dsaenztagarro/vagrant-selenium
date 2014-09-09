require 'vagrant-selenium/util'

module VagrantPlugins
  module Selenium
    module Action
      ##
      # Action class implementation for installing Selenium Server
      class UpdateServer
        def initialize(app, env)
          @app = app
          @machine = env[:machine] # Vagrant::Machine
          @env = @machine.env      # Vagrant::Environment
          @provider = @machine.provider_name
          @config = Util.get_config(@env)
          @logger = Log4r::Logger.new('vagrant::selenium::update_server')
        end

        ##
        # Method that is responsible for doing the actual work
        def call(env)
          @logger.info 'Update Selenium Server start'
          @app.call(env)
          @logger.info 'Update Selenium Server end'
        end
      end
    end
  end
end
