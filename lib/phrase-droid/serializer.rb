module PhraseDroid
  class Serializer
    def initialize(path = 'app/src/main/res')
      @path = path
    end

    def write(xml, locale)
      unless locale == 'en'
        create_values_directory(locale)
      end

      write_values(strings_path(locale), xml)
      puts "  saved values for #{locale}".color(:green)
    end

    def read(locale)
      File.read(strings_path(locale))
    end

    private

    def create_values_directory(locale)
      path = values_path(locale)
      unless Dir.exists?(path)
        Dir.mkdir(path)
        print " created directory <#{path}>".color(:green)
      end
    end

    def write_values(file_path, xml)
      File.open(file_path, 'w+') do |file|
        file.write(xml)
      end
    end

    def strings_path(locale)
      File.join(values_path(locale), 'strings.xml')
    end

    def values_path(locale)
      path = File.join(base_path, "values")

      if locale == 'en'
        path
      else
        "#{path}-#{locale}"
      end
    end

    def base_path
      File.join(Dir.pwd, @path)
    end
  end
end
