module Mister
  class Manager

    PORT=9876
    def initialize(address)
      @service = Mister::Service.new(address, PORT, self)
      @service.start
    end

    def finalize
      @service.stop
    end
  end
end
