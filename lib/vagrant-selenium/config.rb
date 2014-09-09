module VagrantPlugins
  module Selenium
    ##
    # This class is the implementation of configuration keys used from
    # Vagrantfile. Keys are accessed through configuration key ("my_key")
    # defined in Vagrant plugin definition:
    #
    # config "my_key" do
    #   require_relative "vagrant-selenium/config"
    #   Config
    # end
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :enabled
      # Selenium Server attributes
      attr_accessor :server_enabled
      attr_accessor :server_version
      attr_accessor :server_stop_on_machine_down
      attr_accessor :server_install_dir
      # Browser attributes
      attr_accessor :browser_enabled
      attr_accessor :browser_provider
      attr_accessor :browser_version

      def initialize
        @enabled         = UNSET_VALUE
        @server_enabled  = UNSET_VALUE
        @browser_enabled = UNSET_VALUE

        @server_stop_on_machine_down = UNSET_VALUE
      end

      ##
      # Method called only once ever on the final configuration object in order
      # to set defaults
      def finalize!
        @enabled         = false if @enabled == UNSET_VALUE
        @server_enabled  = false if @server_enabled == UNSET_VALUE
        @browser_enabled = false if @browser_enabled == UNSET_VALUE

        @server_stop_on_machine_down = false if
          @server_stop_on_machine_down == UNSET_VALUE
      end

      ##
      # Method called by Vagrant for validation
      # @param machine [Vagrant::Machine] machine managed by vagrant
      def validate(machine)
        errors = []

        errors << validate_bool('selenium.enabled', @enabled)
        errors << validate_bool('selenium.server_enabled', @server_enabled)
        errors << validate_bool('selenium.browser_enabled', @browser_enabled)
        errors.compact!
      end

      private

      def validate_bool(key, value)
        if ![TrueClass, FalseClass].include?(value.class) &&
           value != UNSET_VALUE
          I18n.t('vagrant_selenium.config.not_a_bool',
                 config_key: key, value: value.class.to_s)
        else
          nil
        end
      end
      # TODO: validate browser provider
      # TODO: validate known versions for server/browser pair
      # TODO: warning message for unknown server/browser pair
    end
  end
end
