require "http/client"
require "./email-message"

module EmailQuery
  DEFAULT_HOST = "filedealer.nexploit.app"
  DEFAULT_PORT = 443

  def self.execute(host : String = DEFAULT_HOST,
                   port : Int32 = DEFAULT_PORT,
                   subj_includes : String = "",
                   from_includes : String = "",
                   to_includes : String = "",
                   body_includes : String = "")
    uri = URI.new(
      scheme: "https",
      host: host,
      port: port,
      path: "/mailq",
      query: "subj_includes=#{subj_includes}&from_includes=#{from_includes}&to_includes=#{to_includes}&body_includes=#{body_includes}"
    )

    # Call the server
    body = HTTP::Client.get(uri.to_s).body

    Array(SimpleEmail::Message).from_json(body)
  rescue e : Exception
    Log.error(exception: e) { "Error fetching email: #{e.inspect_with_backtrace}" }
    Array(SimpleEmail::Message).new
  end
end
