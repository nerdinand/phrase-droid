module PhraseDroid
  class Serializer
    def initialize(path = 'app/src/main/res')
      @path = path
    end

    def store(xml, locale)
      if locale == 'en'
        store_values('values/strings.xml', xml)
      else
        create_values_directory(locale)
        store_values("values-#{locale}/strings.xml", xml)
      end
    end

    private

    def create_values_directory(locale)
      values_path = File.join(base_path, "values-#{locale}")
      unless Dir.exists?(values_path)
        puts "mkdir #{values_path}"
        Dir.mkdir(values_path)
      end
    end

    def store_values(file_path, xml)
      puts "store translations in #{file_path}"

      full_path = File.join(Dir.pwd, @path,file_path)

      File.open(full_path, 'w+') do |file|
        file.write(xml)
      end
    end

    def base_path
      File.join(Dir.pwd, @path)
    end
  end
end
