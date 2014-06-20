module PhraseDroid
  module Configuration
    def check_configuration!
      unless configuration? && auth_token?
        raise 'No configuration found! Use <phase-droid init> first.'
      end
    end

    def auth_token?
      configuration.key?('auth_token')
    end

    def auth_token
      configuration['auth_token']
    end

    def configuration
      @@configuration ||= TOML.load_file(configuration_file)
    end

    def configuration?
      File.exists?(configuration_file)
    end

    def configuration_file
      File.join(Dir.pwd, '.phraseapp')
    end
  end
end
