require "http/client"
require "sjson"

#untuk membuat request
module Frequest
  VERSION = "0.1.0"

  def self.new(method, url, headers, body)
    # body = env.params.body.nil? ? env.params.body.to_s : ""   # Ambil body sebagai string

    response = case method
    when "GET"
      body = !body.to_s.empty? ? "?#{body.to_s}" : ""
      HTTP::Client.get(url + body, headers: headers)
    when "POST"
      body = SJSON.stringToJson(body.to_s)
      HTTP::Client.post(url, headers: headers, body: body)
    when "PUT"
      body = SJSON.stringToJson(body.to_s)
      HTTP::Client.put(url, headers: headers, body: body)
    when "DELETE"
      body = SJSON.stringToJson(body.to_s)
      HTTP::Client.delete(url, headers: headers, body: body)
    end

    if !response.nil?
      response.body
    end
  end
end
