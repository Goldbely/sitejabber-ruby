module Sitejabber
  module Auth
    class Token
      class << self
        def get
          Sitejabber.with_redis do |r|
            r.get _redis_key( "token" )
          end
        end

        def set value, expires_at
          Sitejabber.with_redis do |r|
            r.mset _redis_key( "token" ), value, _redis_key( "expires_at" ), expires_at
          end
        end

        def destroy
          Sitejabber.with_redis do |r|
            r.del _redis_key( "token" ), _redis_key( "expires_at" )
          end
        end

        def expired?
          expiration = _token_expires_at

          return true unless expiration

          # TODO: is this timezone compatible?
          expiration <= Time.now
        end

        def valid?
          !expired?
        end

        private

        def _token_expires_at
          Sitejabber.with_redis do |r|
            value = r.get _redis_key( "expires_at" )

            DateTime.parse( value ) if value.present?
          end
        end

        def _redis_key key
          "sitejabber:auth:#{key}"
        end
      end
    end
  end
end
