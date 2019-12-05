module Sitejabber
  class Business < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def bulk domains
      request "businesses/bulk", params: { businesses: domains.to_json }
    end

    def get
      request "businesses/#{domain}"
    end
  end
end
