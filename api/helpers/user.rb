require 'redis'
require 'grape'

module API
  module UserHelper
    def current_user
      @current_user
    end
  
    def require_login
      Grape::API.http_basic do |user, password|
        authorized = { 'test' => 'password1' }[user] == password
        if authorized
          @current_user = user
          return true
        else
          return false
        end
      end
    end
  end
end
