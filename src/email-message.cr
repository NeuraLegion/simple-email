require "json"

struct SimpleEmail::Message                                                                
  include JSON::Serializable                                                  
                                                                              
  def initialize                                                              
  end                                                                         
                                                                                
  property created = Time.utc                                                 
  property from : String = ""                                                 
  property to = Set(String).new                                               
  property subj : String = ""                                                 
  property body : String = ""                                                 
end  
