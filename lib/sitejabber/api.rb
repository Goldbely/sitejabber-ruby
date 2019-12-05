require "faraday"

module Sitejabber
  class Api
    class << self
      def request request
        params = {
          client_token: Sitejabber.api_key,
        }.merge request.params

        conn = Faraday.new request.base_url, headers: request.headers, params: params

        response = conn.send request.verb, request.path

        error = ErrorChecker.new( response.status, response.body, response.headers ).error_if_appropriate
        raise error if error

        JSON.parse response.body
      rescue JSON::ParserError
        {}
      end
    end
  end
end
