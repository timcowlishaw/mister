require 'spec_helper'
describe "mister" do
  it "should delegate to the Mister::CLI command tree" do
    run_simple("mister --help")
    stdout_from("mister --help").should =~ /Mister: A pure ruby implementation of Mapreduce for fun, not profit\./
  end
end

