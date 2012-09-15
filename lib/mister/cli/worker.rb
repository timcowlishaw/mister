module Mister
  class CLI
    class Worker < Climate::Command
      name 'worker'
      description 'Start a worker process, reporting to the manager at the given IP address'
      arg :manager_address, "The address of the manager node to report to"
      subcommand_of Mister::CLI
      def run
        Mister::Worker.new(arguments[:manager_address])
      end
    end
  end
end
