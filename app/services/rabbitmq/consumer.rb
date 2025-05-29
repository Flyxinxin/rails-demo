module Rabbitmq
  class Consumer
    def initialize
      @connection = Bunny.new
      @connection.start
      @channel = @connection.create_channel
    end

    def subscribe(queue_name)
      queue = @channel.queue(queue_name, durable: true)
      queue.subscribe(block: true) do |_delivery_info, _properties, payload|
        process_message(payload)
      end
    end
  end
end
