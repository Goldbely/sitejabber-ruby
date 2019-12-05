module Sitejabber
  class ReviewRequest < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def create params
      request "businesses/#{domain}/review/request/add", params: params, verb: "post"
    end
  end
end
