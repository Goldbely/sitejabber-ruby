module Sitejabber
  class Message < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def index params
      request "businesses/#{domain}/messages", params: params
    end

    def create params
      request "businesses/#{domain}/messsages/send", params: params, verb: "post"
    end
  end
end
