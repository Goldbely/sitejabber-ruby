module Sitejabber
  class ProductReview < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def index params
      request "businesses/#{domain}/product/reviews", params: params
    end

    def create params
      request "businesses/#{domain}/product/reviews/add", params: params, verb: "post"
    end

    def vote params
      request "businesses/#{domain}/product/reviews/vote", params: params, verb: "post"
    end

    def top_rated params
      request "businesses/#{domain}/product/reviews/top-rated", params: params, verb: "post"
    end
  end
end
