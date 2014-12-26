require 'grape'
require_relative './links'
require_relative './likes'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Links
      mount API::V1::Likes
    end
  end
end
