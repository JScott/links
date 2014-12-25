module API
  module V1
    class Links < Grape::API
      resource :links do
        version 'v1'
        format :json
      
        desc "Return list of links"
        get do
          {debug: 'debug'}
        end
      end
    end
  end
end
