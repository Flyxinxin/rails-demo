module Rabbitmq
  module Consumers
    class NotificationConsumer < Rabbitmq::Consumer
        def process_message(payload)
          user_id = payload["user_id"]
          message = payload["message"]
          puts "💬 Send notification to user #{user_id}: #{message}"
        end

        def start
          subscribe("notifications.queue")
        end
    end
  end
end
