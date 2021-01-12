require "./spec_helper"

describe EmailQuery do
  it "calls and parse" do
    res = EmailQuery.execute(from_includes: "no-reply", to_includes: "testspec@nexploit.app")
    res.empty?.should be_false
  end

  it "digest email from JSON" do
    json = <<-JS
      {"from": "test@test.com", "to": ["a@a.com", "b@b.com"], "subj": "aaaa"}
    JS

    email = SimpleEmail::Message.from_json(json)
    email.should be_a(SimpleEmail::Message)
    email.from.should eq("test@test.com")
    email.subj.should eq("aaaa")
  end
end
