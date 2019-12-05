# Ruby bindings
require "faraday"

# Version
require "sitejabber/version"

# Support classes
require "sitejabber/api"
require "sitejabber/api_resource"
require "sitejabber/authenticator"
require "sitejabber/auth/token"
require "sitejabber/error_checker"
require "sitejabber/errors"
require "sitejabber/request"

# Resources
require "sitejabber/resources"

module Sitejabber
  # Values
  @api_url = "https://api.sitejabber.com/v1/"

  class << self
    attr_accessor :api_email
    attr_accessor :api_password
    attr_accessor :api_key
    attr_accessor :default_domain
    attr_accessor :redis

    attr_reader :api_url

    def with_redis
      raise Sitejabber::Error.new( "Sitejabber.redis is not set" ) unless redis

      if redis.respond_to? :with
        redis.with do |r|
          yield r
        end
      else
        yield redis
      end
    end
  end
end
