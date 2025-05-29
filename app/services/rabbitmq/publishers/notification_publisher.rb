module Rabbitmq
  module Publishers
    class NotificationPublisher < Rabbitmq::Publisher
      def publish_brand_created(brand_data)
        publish(
          {
            action: "create",
            brand: brand_data
          },
          "notifications.queue"
        )
      end
    end
  end
end
