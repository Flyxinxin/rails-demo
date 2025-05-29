module Rabbitmq
  class Publisher
    def initialize
      @connection = Bunny.new
      @connection.start
      @channel = @connection.create_channel
    end

    def publish(payload, queue_name)
      queue = @channel.queue(queue_name, durable: true)
      queue.publish(payload.to_json, persistent: true)
    end
  end
end
