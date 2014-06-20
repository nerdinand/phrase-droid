module PhraseDroid
  class Client
    module Locales
      def locales
        locales = get('/locales')
        locales.map do |locale|
          locale['code']
        end
      end
    end
  end
end
