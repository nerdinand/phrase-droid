require 'json'
require 'httparty'

require 'phrase-droid/client/file_imports.rb'
require 'phrase-droid/client/locales.rb'
require 'phrase-droid/client/request.rb'
require 'phrase-droid/client/translations.rb'

module PhraseDroid
  class Client
    include HTTParty
    include FileImports
    include Locales
    include Request
    include Translations

    BASE_URI = 'https://phraseapp.com/api/v1'

    def initialize(auth_token)
      @auth_token = auth_token
      self.class.base_uri(BASE_URI)
    end
  end
end
