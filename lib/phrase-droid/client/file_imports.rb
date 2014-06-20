module PhraseDroid
  class Client
    module FileImports
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
