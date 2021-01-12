require "json"

module SimpleEmail
  struct Message
    include JSON::Serializable

    property created : Time = Time.utc
    property from : String = ""
    property to : Set(String) = Set(String).new
    property subj : String = ""
    property body : String = ""

    def initialize(@created : Time = Time.utc,
                   @from : String = "",
                   @to : Set(String) = Set(String).new,
                   @subj : String = "",
                   @body : String = "")
    end
  end
end
