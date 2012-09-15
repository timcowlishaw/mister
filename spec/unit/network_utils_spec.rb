require 'spec_helper'
describe "Mister::NetworkUtils" do
  describe "drb_uri" do
    it "returns a drb uri for the given address and port" do
      Mister::NetworkUtils.drb_uri("127.0.0.1", 9876).should == "druby://127.0.0.1:9876"
    end
  end
end
