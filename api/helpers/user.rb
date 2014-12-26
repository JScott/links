require 'redis'
require 'grape'

module API
  module UserHelper
    def log_in_as(user)
      @current_user = user
    end
    
    def current_user
      @current_user
    end
  
    def require_login
      http_basic do |user, password|
        authorized = { 'test' => 'password1' }[user] == password
        if authorized
          log_in_as user
          return true
        else
          return false
        end
      end
    end
  end
end
