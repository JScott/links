require_relative '../helpers/redis'

module API
  module V1
    class Links < Grape::API
      resource :links do
        version 'v1'
        format :json
        helpers API::RedisHelper
      
        get do
          redis.smembers 'links'
        end

        params do
          requires :url, type: String
        end
        post do
          redis.sadd 'links', params[:url]
        end
      end
    end
  end
end
