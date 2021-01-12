require "./spec_helper"

describe EmailQuery do
  it "works" do
    res = EmailQuery.execute(from_includes: "no-reply", to_includes: "testspec@nexploit.app")
    res.empty?.should be_false
  end
end
