require 'redis'

module API
  module RedisHelper
    def redis
      @redis ||= Redis.new
    end
  end
end
