require "rspec/expectations"
require 'webmock/rspec'

require_relative '../lib/phrase-droid'

class MockClient < PhraseDroid::Client
    AUTH_TOKEN = 'myAwesomeTranslations'
    BASE_URI = 'http://localhost'

    def initialize
      @auth_token = AUTH_TOKEN
      self.class.base_uri(BASE_URI)
    end
end

def get_fixture(filename)
  return '' if filename.empty?
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def stub_get(url, filename, optional_params = {})
  params = build_params(optional_params)
  body = get_fixture(filename)

  stub_request(:get, "#{MockClient::BASE_URI}#{url}?#{params}").to_return(status: 200, body: body)
end

def stub_post(url, filename)
  params = build_params
  body = get_fixture(filename)

  stub_request(:post, "#{MockClient::BASE_URI}#{url}?#{params}").to_return(status: 200, body: body)
end

def build_params(optional_params = {})
  params = { auth_token: MockClient::AUTH_TOKEN }.merge(optional_params)
  params.map { |key, value| "#{key}=#{value}"}.join('&')
end
