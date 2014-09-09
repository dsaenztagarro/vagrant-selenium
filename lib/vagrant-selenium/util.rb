module VagrantPlugins
  module Selenium
    module Util
      def self.get_config(env)
        env.vagrantfile.config
      end
    end
  end
end
