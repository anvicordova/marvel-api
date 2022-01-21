# frozen_string_literal: true

require 'faraday'
require 'ostruct'

module Marvel
  class Api
    def initialize
      @connection = Faraday.new(
        url: ENV['MARVEL_URL'],
        params: auth_params,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    def fetch(endpoint, params = {})
      response = @connection.get(endpoint, params)
      body = JSON.parse(response.body, symbolize_names: true)

      if response.success?
        OpenStruct.new(
          status: :success,
          success?: true,
          failure?: false,
          data: body[:data],
          attribution: {
            copyright: body[:copyright],
            text: body[:attributionText]
          }
        )
      else
        # Call debugger
        OpenStruct.new(
          status: :failure,
          success?: false,
          failure?: true,
          data: body[:data]
        )
      end
    end

    private

    def auth_params
      timestamp = Time.now.utc.strftime('%Y%m%d%H%M%S')

      {
        ts: timestamp,
        apikey: ENV['MARVEL_PUBLIC_KEY'],
        hash: generate_hash(timestamp)
      }
    end

    def generate_hash(timestamp)
      Digest::MD5.hexdigest(timestamp + ENV['MARVEL_PRIVATE_KEY'] + ENV['MARVEL_PUBLIC_KEY'])
    end
  end
end
