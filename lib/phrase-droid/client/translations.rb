module PhraseDroid
  class Client
    module Translations
      def download(locale)
        get('/translations/download.xml', { locale_name: locale, include_empty_translations: 1 })      
      end
    end
  end
end
