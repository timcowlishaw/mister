module Mister
  class CLI
    class Manager < Climate::Command
      name "manager"
      description "Start the manager process, listening on the specified IP address"
      arg :ip_address, "The IP address which the manager process listens on"
      subcommand_of Mister::CLI
      def run
        Mister::Manager.new(arguments[:ip_address])
      end
    end
  end
end
