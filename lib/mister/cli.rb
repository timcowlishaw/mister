require 'climate'
module Mister
  class CLI < Climate::Command
    name 'mister'
    description 'Mister: A pure ruby implementation of Mapreduce for fun, not profit.'
  end
end
require 'mister/cli/manager'
