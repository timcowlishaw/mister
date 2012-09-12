require 'spec_helper'
describe "Mister::CLI" do
  it "has the name 'mister'" do
    Mister::CLI.name.should == 'mister'
  end

  it "has an appropriate description" do
    Mister::CLI.description.should == 'Mister: A pure ruby implementation of Mapreduce for fun, not profit.'
  end
end
