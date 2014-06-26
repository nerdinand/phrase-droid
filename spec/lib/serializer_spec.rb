require 'spec_helper'

describe PhraseDroid::Serializer do
  let (:serializer) { PhraseDroid::Serializer.new('spec/tmp') }

  it 'writes a XML file' do
    serializer.write(get_fixture('values-de.xml'), 'de')

    output_file = File.join(Dir.pwd, 'spec/tmp/values-de/strings.xml')
    expect(File.exist?(output_file)).to be true
  end

  it 'reads a XML file' do
    serializer.write(get_fixture('values-de.xml'), 'de')
    
    xml = serializer.read('de')
    expect(xml).to include('send')
    expect(xml).to include('Senden')
  end
end
