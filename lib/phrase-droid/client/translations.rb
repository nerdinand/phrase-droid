module PhraseDroid
  class Client
    module Translations
      # Get the translations as Android String XML for the specifed locale.
      #
      # @param [String] locale the locale
      # @return [String] Android String XML
      def download(locale)
        get('/translations/download.xml', { locale_name: locale, include_empty_translations: 1 })
      end
    end
  end
end
