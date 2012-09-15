require 'spec_helper'
require 'drb'
describe "Mister::RemoteRef" do

  class TestService
    def echo(msg)
      return msg
    end
  end

  before :each do
    DRb.start_service("druby://127.0.0.2:9876", TestService.new)
    @ref = Mister::RemoteRef.new("127.0.0.2", 9876)
    @ref.connect
  end

  after :each do
    DRb.stop_service
  end

  it "forwards calls to missing methods to the remote service over DRb when the service is connected" do
    result = @ref.echo(:sentinel)
    @ref.disconnect
    result.should == :sentinel
  end

  it "raises an exception when a forwarded method is called and the remoteRef is disconnected" do
    @ref.disconnect
    lambda { @ref.echo(:sentinel) }.should raise_error(Mister::RemoteRef::NotConnectedError)
  end


  it "is disconnected by default" do
    ref = Mister::RemoteRef.new("127.0.0.2", 9876)
    lambda { ref.echo(:sentinel) }.should raise_error(Mister::RemoteRef::NotConnectedError)
  end
end
