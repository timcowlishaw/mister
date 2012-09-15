require 'socket'
module Mister
  module NetworkUtils
    class << self

      def drb_uri(address, port)
        return "druby://#{address}:#{port}"
      end

      def local_interface_for_remote_address(remote_address)
        # We want to get the ip address of the local interface used to connect to the specified remote. Since UDP is stateless,
        # This code will open a socket, get the appropriate address from the OS's network stack but never actually connect to the remote host or send any packets.
        # See http://coderrr.wordpress.com/2008/05/28/get-your-local-ip-address/ for more explanation.
        UDPSocket.open { |s| s.connect(remote_address, 1); s.addr.last }
      end
    end
  end
end
