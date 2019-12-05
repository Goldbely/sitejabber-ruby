module Sitejabber
  class ApiResource
    MUTEX = Mutex.new

    def initialize; end

    def request path, verb: "get", params: {}, options: {}
      MUTEX.synchronize do
        begin
          _renew_token if Auth::Token.expired?

          _call_api path, verb, params, options
        rescue AuthenticationError => ae
          if [ 203, 204, 206, 207 ].include? ae.error_info[ "errorCode" ]
            # Invalid token/session, try again
            _renew_token
            _call_api path, verb, params, options
          else
            raise ae
          end
        end
      end
    end

    private

    def _call_api path, verb, params, options
      opts = options.dup
      opts[ :headers ] ||= {}
      opts[ :headers ].merge! "user_token" => Auth::Token.get

      request = Request.new path, options: opts, params: params, verb: verb

      Api.request request
    end

    def _renew_token
      response = Authenticator.new.request_token

      Auth::Token.set response[ "token" ], response[ "expire" ]
    end
  end
end
