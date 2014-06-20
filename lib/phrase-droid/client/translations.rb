module PhraseDroid
  class Client
    module Translations
      def download(locale)
        response = get('/translations/download.xml', { locale_name: locale, include_empty_translations: 1 })
        response.body
      end
    end
  end
end
