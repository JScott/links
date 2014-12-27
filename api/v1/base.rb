require 'grape'
require_relative './links'
require_relative './likes'
require_relative './users'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Links
      mount API::V1::Likes
      mount API::V1::Users
    end
  end
end
