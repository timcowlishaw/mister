require 'spec_helper'
describe Mister::Manager do

  describe "#initialize" do
    it "creates a service, bound to the passed IP address and the manager process port" do
      address = "127.0.0.1"
      service = stub_everything('service')
      expect = Mister::Service.expects(:new).returns(service)
      instance = Mister::Manager.new(address)
      expect.with(address, Mister::Manager::PORT, instance)
    end
    it "starts the created service" do
      service = mock('service')
      service.expects(:start)
      Mister::Service.stubs(:new).returns(service)
      instance = Mister::Manager.new("127.0.0.1")
    end
  end

  describe "#finalize" do
    it "shuts down the service" do
      service = mock('service', :start => true)
      Mister::Service.stubs(:new).returns(service)
      instance = Mister::Manager.new("127.0.0.1")
      service.expects(:stop)
      instance.finalize
    end
  end
end
