require 'spec_helper'
describe "Mister::CLI::Manager" do
  it "Starts the Manager process bound to the specified address" do
    address = "127.0.0.1"
    Mister::Manager.expects(:new).with(address)
    Mister::CLI::Manager.run([address])
  end

  it "has the name 'manager'" do
    Mister::CLI::Manager.name.should == 'manager'
  end

  it "has an appropriate description" do
    Mister::CLI::Manager.description.should == 'Start the manager process, listening on the specified IP address'
  end

  it "takes a single argument which specifies the IP address on which the manager process listens" do
    Mister::CLI::Manager.should have_argument(:ip_address)
  end

  it "is a subcommand of Mister::CLI" do
    Mister::CLI::Manager.should be_subcommand_of(Mister::CLI)
  end
end
