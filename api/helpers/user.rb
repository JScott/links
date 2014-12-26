require 'redis'
require 'grape'

module API
  module UserHelper
    def current_user
      @current_user
    end
    
    def login_as(user)
      @current_user = user
    end
  end
end
