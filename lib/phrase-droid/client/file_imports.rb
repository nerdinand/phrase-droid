module PhraseDroid
  class Client
    module FileImports
      # Upload the Android String XML file for the specifed locale.
      #
      # @param [String] locale the locale
      # @param [String] XML the file content of the Android String XML
      # @return [Response] the response
      def upload(locale, xml)
        post('/file_imports', {
          :'file_import[locale_code]'  => locale,
          :'file_import[filename]'     => "#{locale}.xml",
          :'file_import[file_content]' => xml
          })
      end
    end
  end
end
