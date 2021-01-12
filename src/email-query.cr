require "http/client"
require "./email-message"

module EmailQuery
  DEFAULT_URI  = "filedealer.nexploit.app"
  DEFAULT_PORT = 443

  def self.execute(uri : String = DEFAULT_URI, port : Int32 = DEFAULT_PORT,
                   subj_includes = String.new, from_includes = String.new,
                   to_includes = String.new, body_includes = String.new)
    client = HTTP::Client.new(host: uri, port: port, tls: OpenSSL::SSL::Context::Client.new)
    query = "subj_includes=#{subj_includes}&from_includes=#{from_includes}" \
            "&to_includes=#{to_includes}&body_includes=#{body_includes}"
    resp = client.get("mailq?#{query}")
    res = Array(SimpleEmail::Message).new
    if resp.status_code == 200 && resp.content_type == "application/json"
      res = Array(SimpleEmail::Message).from_json(resp.body)
    end
    res
  ensure
    client.close if client
  end
end
