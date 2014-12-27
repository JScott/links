require_relative '../helpers/redis'
require_relative '../helpers/user'

module API
  module V1
    class Reviews < Grape::API
      resource :reviews do
        version 'v1'
        format :json
        helpers API::RedisHelper
        helpers API::UserHelper
      
        params do 
          optional :user, type: String
          optional :url, type: String
        end
        get do
          if (params[:user] && params[:url])
            redis.hgetall "reviews:#{params[:user]:params[:url]}"
          else
            redis.smembers 'reviews'
          end
        end

        http_basic do |user, password|
          authorized = { 'test' => 'password1' }[user] == password
          login_as user if authorized
          authorized
        end
        params do 
          requires :url, type: String
          requires :review, type: String
          optional :summary, type: String
        end
        post do
          redis.hmset "reviews:#{params[:user]}:#{params[:url]}",
                      review, params[:review],
                      summary, params[:summary]
        end
      end
    end
  end
end
