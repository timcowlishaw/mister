module Mister
  class Worker
    def initialize(manager_address)
      @manager = RemoteRef.new(manager_address, Manager::PORT)
      @service = WorkerService.new(manager_address)
      @service.start
      @manager.connect
    end

    def finalize
      @manager.disconnect
      @service.stop
    end

    class WorkerService
      PORT = 8765

      def initialize(manager_address)
        local_address = Mister::NetworkUtils.local_interface_for_remote_address(manager_address)
        @service = Service.new(local_address, PORT, self)
      end

      def start
        @service.start
      end

      def stop
        @service.stop
      end
    end
  end
end
