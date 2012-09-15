require 'drb'
module Mister
  class Service

    def initialize(address, port, object)
      @address = address
      @port = port
      @object = object
    end

    def uri
      Mister::NetworkUtils.drb_uri(@address, @port)
    end

    def start
      DRb.start_service(uri, @object, :safe_level => 1)
    end

    def stop
      DRb.stop_service
    end
  end
end
