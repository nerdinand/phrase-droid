require 'spec_helper'

describe PhraseDroid::Client::FileImports do
  it 'uploads the translations' do
    stub = stub_post('/file_imports', 'success.json')

    client = MockClient.new
    xml = client.upload('de', get_fixture('values-de.xml'))

    expect(stub).to have_been_requested

    expect(xml).to include('success')
    expect(xml).to include('true')
  end
end
