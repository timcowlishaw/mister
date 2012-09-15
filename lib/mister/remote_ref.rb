require 'drb'
module Mister
  class RemoteRef

    def initialize(remote_address, port)
      @remote_address = remote_address
      @port = port
    end

    def connect
      @remote = DRbObject.new_with_uri(self.uri)
    end

    def disconnect
      @remote = nil
    end

    def uri
      Mister::NetworkUtils.drb_uri(@remote_address, @port)
    end

    def method_missing(method, *a, &b)
      raise NotConnectedError unless @remote
      @remote.send(method, *a, &b)
    end

    class NotConnectedError < RuntimeError
    end
  end
end


