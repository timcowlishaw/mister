require 'spec_helper'
require 'drb'
describe Mister::Service do

  class TestService
    attr_reader :private_state

    def initialize
      @private_state = :unaltered
    end

    def idiocy(msg)
      begin
        instance_eval(msg)
      rescue SecurityError
        # We don't want the exception to clobber the rest of our test suite. Silently ignore it.
      end
    end

    def echo(msg)
      return msg
    end
  end

  before(:each) do
    @instance = TestService.new
    @service = Mister::Service.new("0.0.0.0", "9876", @instance)
    @service.start
    @remote_instance = DRbObject.new_with_uri("druby://127.0.0.1:9876") #If we listen on the same IP address as we connect, DRb will silently default to invoking the method locally, which makes our safe mode test fail.
  end

  after(:each) do
    @service.stop
  end

  it "starts a DRB service bound to the provided address and port, exposing the provided object" do
    @remote_instance.echo(:sentinel).should == :sentinel
  end

  it "runs the drb service in safe mode, ensuring dangerous strings are not evalled" do
    @remote_instance.idiocy("@private_state = :altered")
    @instance.private_state.should == :unaltered
  end

  it "doesn't affect the safety level of the rest of the calling context" do
    $SAFE.should == 0
  end

  it "shuts the drb service down cleanly" do
    DRb.primary_server.should_not be_nil
    @service.stop
    DRb.primary_server.should be_nil
  end
end
