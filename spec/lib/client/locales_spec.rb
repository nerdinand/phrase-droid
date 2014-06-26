require 'spec_helper'

describe PhraseDroid::Client::Locales do
  it 'returns the locales' do
    stub = stub_get('/locales', 'locales.json')

    client = MockClient.new
    locales = client.locales

    expect(stub).to have_been_requested

    expect(locales).to include('de')
    expect(locales).to include('en')
  end
end
