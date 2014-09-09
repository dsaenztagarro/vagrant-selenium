module VagrantPlugins
  module Selenium
    module Action
      ##
      # Action class implementation for stopping selenium server once the
      # vagrant machine is stopped
      class StopServer
        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @global_env = @machine.env
          @provider = @machine.provider_name
          @config = Util.get_config(@global_env)
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
