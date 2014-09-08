module VagrantPlugins
  module Selenium
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :enabled
      attr_accessor :manage_server
      attr_accessor :server_version
      attr_accessor :manage_browser
      attr_accessor :browser_provider
      attr_accessor :browser_version

      def initialize
        @enabled        = UNSET_VALUE
        @manage_server  = UNSET_VALUE
        @manage_browser = UNSET_VALUE
      end

      def finalize!
        @enabled        = false if @enabled == UNSET_VALUE
        @manage_server  = false if @enabled == UNSET_VALUE
        @manage_browser = false if @enabled == UNSET_VALUE
      end

      def validate(machine)
        errors = []

        errors << validate_bool('selenium.enabled', @enabled)
        errors << validate_bool('selenium.manage_server', @manage_server)
        errors << validate_bool('selenium.manage_browser', @manage_browser)
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
