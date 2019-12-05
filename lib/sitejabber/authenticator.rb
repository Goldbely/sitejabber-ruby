module Sitejabber
  class Authenticator
    def initialize
      unless Sitejabber.api_email && Sitejabber.api_password
        raise Sitejabber::Error, "Sitejabber.api_email / Sitejabber.api_password are not set."
      end
    end

    def request_token
      request = Request.new "login", params: {
        email: Sitejabber.api_email,
        password: Sitejabber.api_password,
      }

      Api.request request
    end
  end
end
