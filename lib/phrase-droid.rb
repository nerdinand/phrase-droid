require 'pry'
require 'rainbow/ext/string'
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

      puts "Pull translations"

      client.locales.each do |locale|
        xml = client.download(locale)
        serializer.write(xml, locale)
      end
    end

    def push
      check_configuration!

      puts "Push translations"

      client.locales.each do |locale|
        xml = serializer.read(locale)
        client.upload(locale, xml)

        puts "  pushed values for #{locale} to PhraseApp".color(:green)
      end
    end

    private

    def client
      @@client ||= PhraseDroid::Client.new(auth_token)
    end

    def serializer
      PhraseDroid::Serializer.new
    end
  end
end
