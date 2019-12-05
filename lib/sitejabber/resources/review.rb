module Sitejabber
  class Review < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def index params = {}
      request "businesses/#{domain}/reviews", params: params
    end

    def create params
      request "businesses/#{domain}/reviews/add", params: params, verb: "post"
    end

    def publish params
      request "businesses/#{domain}/reviews/publish", params: params, verb: "post"
    end

    def flag params
      request "businesses/#{domain}/reviews/flag", params: params, verb: "post"
    end
  end
end
