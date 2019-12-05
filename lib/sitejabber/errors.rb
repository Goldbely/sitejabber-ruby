module Sitejabber
  class Error < StandardError; end

  class APIError < ::Sitejabber::Error
    attr_reader :http_status, :body, :error_info

    def initialize http_status, body, error_info = {}
      @http_status = http_status
      @body = body
      @error_info = error_info
    end
  end

  # An error while attempting to request an access token
  class OAuthTokenRequestError < APIError; end

  # API rate limit
  class RateLimitError < APIError; end

  # Any error with a 5xx HTTP status code
  class ServerError < APIError; end

  # Any error with a 4xx HTTP status code
  class ClientError < APIError; end

  # All API authentication failures
  class AuthenticationError < ClientError; end
end
