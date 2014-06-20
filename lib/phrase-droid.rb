require 'toml'

require 'phrase-droid/client.rb'
require 'phrase-droid/configuration.rb'
require 'phrase-droid/serializer.rb'
require 'phrase-droid/version.rb'

module PhraseDroid
  class << self
    include Configuration

    def init(auth_token)
      File.open(configuration_file, 'w+') do |file|
        file.write("auth_token = \"#{auth_token}\"")
      end
    end

    def pull
      check_configuration!

      serializer = PhraseDroid::Serializer.new
      client.locales.each do |locale|
        xml = client.download(locale)
        serializer.store(xml, locale)
      end
    end

    def push
      check_configuration!
    end

    private

    def client
      @@client ||= PhraseDroid::Client.new(auth_token)
    end
  end
end
