require_relative '../helpers/redis'
require_relative '../helpers/user'

module API
  module V1
    class Likes < Grape::API
      resource :likes do
        version 'v1'
        format :json
        helpers API::RedisHelper
        helpers API::UserHelper
      
        params do 
          requires :url, type: String
        end
        get do
          redis.smembers "likes:#{params[:url]}"
        end

        http_basic do |user, password|
          authorized = { 'test' => 'password1' }[user] == password
          login_as user if authorized
          authorized
        end
        params do 
          requires :url, type: String
        end
        post do
          redis.sadd "likes:#{params[:url]}", current_user
        end
      end
    end
  end
end
