module PhraseDroid
  class Client
    module Locales
      # Get the locales.
      #
      # @return [Array] the locales
      def locales
        locales = JSON.parse(get('/locales'))
        locales.map do |locale|
          locale['code']
        end
      end
    end
  end
end
