require 'spec_helper'

describe PhraseDroid::Client::Translations do
  it 'downloads the translations' do
    stub = stub_get('/translations/download.xml', 'values-de.xml', {
      include_empty_translations: 1,
      locale_name: :de
      })

    client = MockClient.new
    xml = client.download('de')

    expect(stub).to have_been_requested

    expect(xml).to include('send')
    expect(xml).to include('Senden')
  end
end
