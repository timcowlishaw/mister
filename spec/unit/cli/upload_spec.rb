require 'spec_helper'
describe "Mister::CLI::Upload" do
  it "has the name 'upload'" do
    Mister::CLI::Upload.name.should == 'upload'
  end

  it "has an appropriate description" do
    Mister::CLI::Upload.description.should == 'Upload the given file to the cluster whose manager node is at the given IP'
  end

  it "is a subcommand of Mister::CLI" do
    Mister::CLI::Upload.should be_subcommand_of(Mister::CLI)
  end

  it "has an argument which specifies the address of the manager node" do
    Mister::CLI::Upload.should have_argument(:manager_address)
  end

  it "has an argument which specifies the path to the file to upload" do
    Mister::CLI::Upload.should have_argument(:file)
  end

  it "creates an uploader object, passing the mananager address and filename" do
    manager_address = "127.0.0.1"
    filename = "sentinel.txt"
    Mister::Uploader.expects(:new).with(manager_address, filename)
    Mister::CLI::Upload.run([manager_address, filename])
  end
end
