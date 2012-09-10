require 'spec_helper'
describe "mister" do
  it "should call Mister::CLI#run with the provided arguments" do
    Mister::CLI.expects(:run).with(["arg1", "arg2"])
    run_simple("mister arg1 arg2")
  end
end

