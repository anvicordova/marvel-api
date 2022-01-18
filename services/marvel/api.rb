require "faraday"

module Marvel
  class Api
    def initialize
      @connection = Faraday.new(
        url: ENV["MARVEL_URL"],
        params: auth_params,
        headers: {'Content-Type' => 'application/json'}
      )
    end

    def fetch(endpoint, params = {})
      response = @connection.get(endpoint, params)
      
      if response.success?
        JSON.parse(response.body, symbolize_names: true)
      else
        {}
      end
    end

    private

    def auth_params
      timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")

      {
        ts: timestamp,
        apikey: ENV["MARVEL_PUBLIC_KEY"],
        hash: generate_hash(timestamp)
      }
    end

    def generate_hash(timestamp)
      Digest::MD5.hexdigest(timestamp + ENV["MARVEL_PRIVATE_KEY"] + ENV["MARVEL_PUBLIC_KEY"])
    end
  end
end