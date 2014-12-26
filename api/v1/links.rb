require_relative '../helpers/redis'

module API
  module V1
    class Links < Grape::API
      resource :links do
        version 'v1'
        format :json
        helpers API::RedisHelper
      
        desc "Return list of links"
        get do
          params do 
            optional :url, type: String
          end
          if params[:url]
            redis.hgetall "#{params[:url]}:details"
          else
            redis.smembers 'links'
          end
        end

        post :add do
          params do 
            requires :url, type: String
          end
          redis.sadd 'links', params[:url]
          redis.hmset "#{params[:url]}:details", 'likes', 0
        end

        http_basic do |username, password|
         { 'test' => 'password1' }[username] == password
        end
      end
    end
  end
end
