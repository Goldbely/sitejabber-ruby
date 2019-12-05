module Sitejabber
  class ErrorChecker
    attr_reader :http_status, :body, :headers

    def initialize http_status, body, headers
      @http_status = http_status.to_i
      @body = body
      @headers = headers
    end

    def error_if_appropriate
      if http_status >= 500
        ServerError.new http_status, body
      elsif http_status >= 400
        ClientError.new http_status, body
      elsif http_status >= 300
        ServerError.new http_status, body
      elsif response_hash[ "errorCode" ]
        error_class.new http_status, body, error_info
      end
    end

    protected

    def error_class
      code = response_hash[ "errorCode" ].to_i

      if code < 200
        OAuthTokenRequestError
      elsif code < 300
        AuthenticationError
      elsif code < 429
        ClientError
      elsif code == 429
        RateLimitError
      else
        APIError
      end
    end

    def error_info
      response_hash.slice "errorCode", "errorReason"
    end

    def response_hash
      @response_hash ||= begin
        JSON.parse body
      rescue JSON::ParserError
        {}
      end
    end
  end
end
