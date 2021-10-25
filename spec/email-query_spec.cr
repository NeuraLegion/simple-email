require "./spec_helper"

describe SimpleEmail::Query do
  it "calls and parse" do
    res = SimpleEmail::Query.execute(from_includes: "no-reply", to_includes: "testspec@app.neuralegion.com")
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
