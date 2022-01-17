require "uri"
require "digest"
require "json"
require "net/http"

module Marvel
  class BaseService
    def fetch(endpoint, params = {})
      uri = URI.parse("#{ENV["MARVEL_URL"]}/#{endpoint}")
      uri.query = URI.encode_www_form(query_params.merge(params))

      JSON.parse(
        Net::HTTP.get_response(uri).body,
        symbolize_names: true
      )
    end

    private

    def query_params
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