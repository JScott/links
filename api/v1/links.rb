require 'grape'

module API
  module V1
    class Links < Grape::API
      version 'v1'
      format :json

      resource :links do
        desc "Return list of links"
        get do
          return {debug: 'debug'};
        end
      end
    end
  end
end