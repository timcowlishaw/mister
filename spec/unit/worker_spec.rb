require 'spec_helper'
describe "Mister::Worker" do
  describe "initialize" do

    before :each do
      Mister::Service.any_instance.stubs(:start) #Don't actually start the service while we're unit testing
    end

    it "gets a reference to the provided manager service" do
      manager_ip = "127.0.0.1"
      ref = mock("ref", :connect => true)
      Mister::RemoteRef.expects(:new).with(manager_ip, Mister::Manager::PORT).returns(ref)
      Mister::Worker.new(manager_ip)
    end

    it "exposes a worker service to the manager" do
      manager_ip = "127.0.0.1"
      service = mock("service", :start => true)
      expectation = Mister::Worker::WorkerService.expects(:new).returns(service)
      instance = Mister::Worker.new(manager_ip)
      expectation.with(manager_ip)
    end

    it "starts the underlying worker service" do
      service = mock("service")
      service.expects(:start)
      Mister::Worker::WorkerService.stubs(:new).returns(service)
      worker = Mister::Worker.new("127.0.0.1")
    end

    it "connects the manager reference" do
      ref = mock("ref")
      ref.expects(:connect)
      Mister::RemoteRef.stubs(:new).returns(ref)
      worker = Mister::Worker.new("127.0.0.1")
    end
  end

  describe "finalize" do
    it "stops the underlying worker service" do
      service = mock("service", :start => true)
      service.expects(:stop)
      Mister::Worker::WorkerService.stubs(:new).returns(service)
      worker = Mister::Worker.new("127.0.0.1")
      worker.finalize
    end

    it "disconnects the manager reference" do
      ref = mock("ref", :connect => true)
      ref.expects(:disconnect)
      Mister::RemoteRef.stubs(:new).returns(ref)
      worker = Mister::Worker.new("127.0.0.1")
      worker.finalize
    end
  end

  describe "WorkerService" do
    describe "initialization" do
      it "starts itself as a service on the interface used to connect to the manager" do
        manager_ip = "127.0.0.1"
        local_ip = "127.0.0.2"
        Mister::NetworkUtils.expects(:local_interface_for_remote_address).with(manager_ip).returns(local_ip)
        expectation = Mister::Service.expects(:new)
        instance = Mister::Worker::WorkerService.new(manager_ip)
        expectation.with(local_ip, Mister::Worker::WorkerService::PORT, instance)
      end
    end

    describe "start" do
      it "starts the underlying service" do
        service = mock("service")
        service.expects(:start)
        Mister::Service.stubs(:new).returns(service)
        worker_service = Mister::Worker::WorkerService.new("127.0.0.1")
        worker_service.start
      end
    end

    describe "stop" do
      it "stops the underlying service" do
        service = mock("service")
        service.expects(:stop)
        Mister::Service.stubs(:new).returns(service)
        worker_service = Mister::Worker::WorkerService.new("127.0.0.1")
        worker_service.stop
      end
    end
  end
end
