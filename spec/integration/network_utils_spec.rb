require 'spec_helper'
describe "Mister::NetworkUtils" do
  describe "local_interface_for_remote_address" do
    it "returns the IP address of the local interface used to connect to the specified address" do
      Mister::NetworkUtils.local_interface_for_remote_address("127.0.0.2").should == "127.0.0.1"
    end
  end
end
