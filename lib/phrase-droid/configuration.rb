module PhraseDroid
  module Configuration
    # Stores the configuration to the configuration file.
    #
    # @param [Hash] configuration the configuration
    def store_configuration(configuration)
      File.open(configuration_file, 'w+') do |file|
        configuration.each do |key, value|
          file.puts("#{key} = #{value}")
        end
      end
    end

    # Check if a valid configuration exists, otherwise raise an exception.
    #
    def check_configuration!
      unless configuration? && auth_token?
        raise 'No configuration found! Use <phase-droid init> first.'
      end
    end

    # Return true if an auth token exists, otherwise false.
    #
    # @return [Boolean] true if an auth token exists, otherwise false
    def auth_token?
      configuration.key?('auth_token')
    end

    # Return the auth token.
    #
    # @return [String] the auth token
    def auth_token
      configuration['auth_token']
    end

    def resources_path
      configuration['resources_path'] || 'app/src/main/res'
    end

    # Return the configuration.
    #
    # @return [Hash] the configuration
    def configuration
      @@configuration ||= TOML.load_file(configuration_file)
    end

    # Return true if the configuration exists, otherwise false.
    #
    # @return [Boolean] true if the configuration exists, otherwise false
    def configuration?
      File.exists?(configuration_file)
    end

    # Return the configuration file path.
    #
    # @return [String] the configuration file path
    def configuration_file
      File.join(Dir.pwd, '.phraseapp')
    end
  end
end
