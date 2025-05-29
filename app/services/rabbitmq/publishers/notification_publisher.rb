  module Rabbitmq
    module Publishers
      class NotificationPublisher < Rabbitmq::Publisher
        def send_notification(user_id, message)
          publish({ user_id: user_id, message: message }, "notifications.queue")
        end
      end
    end
  end
