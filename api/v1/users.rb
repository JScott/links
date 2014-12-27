require_relative '../helpers/redis'

module API
  module V1
    class Users < Grape::API
      resource :users do
        version 'v1'
        format :json
        helpers API::RedisHelper
      
        get do
          redis.smembers "users"
        end

        params do 
          requires :email, type: String #, regexp: /.+@.+/  
          requires :user, type: String, regexp: /^[^:]*$/
          requires :password, type: String
        end
        post do
          redis.sadd "users", params[:user]
          #TODO: salt the password
          #TODO: passwords via params are terrible
          redis.hmset "users:#{params[:user]}",
                      'password', params[:password],
                      'email', params[:email]
        end
      end
    end
  end
end
