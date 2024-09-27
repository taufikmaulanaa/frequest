require "http/client"
require "sjson"

#untuk membuat request
module Frequest
  VERSION = "0.1.0"

  def self.new(method, url, headers, body, only_return_body = true)
    # body = env.params.body.nil? ? env.params.body.to_s : ""   # Ambil body sebagai string

    response = case method
    when "GET"
      body = !body.to_s.empty? ? "?#{body.to_s}" : ""
      HTTP::Client.get(url + body, headers: headers)
    when "POST"
      body = (SJSON.stringToHash(body.to_s).to_json.to_s)
      HTTP::Client.post(url, headers: headers, body: body.to_s)
    when "PUT"
      body = (SJSON.stringToHash(body.to_s).to_json.to_s)
      HTTP::Client.put(url, headers: headers, body: body.to_s)
    when "DELETE"
      body = (SJSON.stringToHash(body.to_s).to_json.to_s)
      HTTP::Client.delete(url, headers: headers, body: body.to_s)
    end

    if !response.nil?
      if only_return_body
        response.body
      else
        response
      end
    end
  end
end
