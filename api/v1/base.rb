require 'grape'
require_relative './links'

module API
  module V1
    class Base < Grape::API
      mount API::V1::Links
    end
  end
end
