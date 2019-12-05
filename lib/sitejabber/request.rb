module  Sitejabber
  class Request
    attr_reader :raw_params, :raw_options, :raw_path, :raw_verb

    def initialize path, params: {}, options: {}, verb: "get"
      @raw_params = params
      @raw_options = options
      @raw_path = path
      @raw_verb = verb
    end

    def params
      raw_params
    end

    def base_url
      Sitejabber.api_url
    end

    def headers
      {
        "Content-Type": "application/json",
      }.merge( raw_options[ :headers ] || {})
    end

    def options
      raw_options

      # TODO: verify certificate
      # raw_options.merge(
      #   use_ssl: true,
      #   ssl: { verify: true }.merge( raw_options[ :ssl ] || {} ),
      # )
    end

    def path
      raw_path
    end

    def verb
      raw_verb
    end
  end
end
