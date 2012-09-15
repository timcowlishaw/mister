require 'spec_helper'
describe "Mister::CLI::Worker" do
  it "starts the worker process, connecting to the manager at the provided address" do
    manager_address = "127.0.0.1"
    Mister::Worker.expects(:new).with(manager_address)
    Mister::CLI::Worker.run([manager_address])
  end

  it "has the name 'worker'" do
    Mister::CLI::Worker.name.should == 'worker'
  end

  it "has an appropriate description" do
    Mister::CLI::Worker.description.should == 'Start a worker process, reporting to the manager at the given IP address'
  end

  it "takes a single argument which specifies the address of the manager node" do
    Mister::CLI::Worker.should have_argument(:manager_address)
  end

  it "is a subcommand of Mister::CLI" do
    Mister::CLI::Worker.should be_subcommand_of(Mister::CLI)
  end
end
