module Sitejabber
  class Comment < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def index params
      request "businesses/#{domain}/review/comments", params: params
    end

    def create params
      request "businesses/#{domain}/review/comments/add", params: params, verb: "post"
    end
  end
end
