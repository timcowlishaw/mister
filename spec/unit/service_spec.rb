require 'spec_helper'
describe Mister::Service do
  describe "#uri" do
    it "exposes a druby uri for this service" do
      service = Mister::Service.new("127.0.0.1", "9876", Object.new)
      service.uri.should == "druby://127.0.0.1:9876"
    end
  end

end
