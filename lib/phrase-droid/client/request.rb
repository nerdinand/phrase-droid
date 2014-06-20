module PhraseDroid
  class Client
    module Request

      class RequestError < StandardError
      end

      private

      def get(path, options = {})
        response = self.class.get(build_url(path, options))

        unless response.code.eql?(200)
          raise_error(response.body)
        end

        response.body
      end

      def post(path, body, options = {})
        response = self.class.post(build_url(path, options), body: body)

        unless response.code.eql?(200)
          raise_error(response.body)
        end

        response.body
      end

      def raise_error(body)
        raise RequestError.new("There was a request error! Response was: #{body}")
      end

      def build_url(path, options)
        "#{path}?#{url_params(options)}"
      end

      def url_params(options)
        params = { auth_token: @auth_token }.merge(options)
        params.map { |k,v| "#{k}=#{v}" }.join('&')
      end
    end
  end
end
