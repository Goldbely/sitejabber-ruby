module Sitejabber
  class Product < ApiResource
    attr_reader :domain

    def initialize domain = nil
      @domain = domain || Sitejabber.default_domain
    end

    def index params
      request "businesses/#{domain}/products", params: params
    end

    def create params
      request "businesses/#{domain}/products/add", params: params, verb: "post"
    end

    def destroy params
      request "businesses/#{domain}/products/remove", params: params, verb: "post"
    end

    def create_image params
      request "businesses/#{domain}/product/images/add", params: params, verb: "post"
    end

    def destroy_image params
      request "businesses/#{domain}/product/images/remove", params: params, verb: "post"
    end
  end
end
