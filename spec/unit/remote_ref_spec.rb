require 'spec_helper'
describe Mister::RemoteRef do
  describe "#uri" do
    it "exposes a druby uri for the referenced service" do
      service = Mister::RemoteRef.new("127.0.0.1", "9876")
      service.uri.should == "druby://127.0.0.1:9876"
    end
  end

end
