module Mister
  class CLI
    class Upload < Climate::Command
      name 'upload'
      description 'Upload the given file to the cluster whose manager node is at the given IP'
      subcommand_of Mister::CLI
      arg :manager_address, "The address of the manager node of the cluster"
      arg :file, "The path to the file to upload"
    end
  end
end
