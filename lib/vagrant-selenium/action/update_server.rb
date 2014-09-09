module VagrantPlugins
  module Selenium
    module Action
      ##
      # Action class implementation for installing Selenium Server
      class UpdateServer
        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = @machine.provider_name
          @config = Util.get_config(@global_env)
          @logger = Log4r::Logger.new('vagrant::selenium::install_all')
        end

        ##
        # Method that is responsible for doing the actual work
        def call(env)
          require 'pry'
          binding.pry
          @logger.info 'Update Selenium Server start'
          @app.call(env)
          @logger.info 'Update Selenium Server end'
        end
      end
    end
  end
end
