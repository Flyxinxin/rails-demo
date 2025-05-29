# app/services/rabbitmq/consumers/notification_consumer.rb
module Rabbitmq
  module Consumers
    class NotificationConsumer < Rabbitmq::Consumer
      def process_message(payload)
        puts "[CONSUMER] Raw payload: #{payload.inspect}"
        data = JSON.parse(payload).with_indifferent_access

        if data[:action] == "create"
          brand = Brand.find_or_initialize_by(slug: data[:brand]["slug"])
          brand.assign_attributes(data[:brand])

          if brand.new_record?
            brand.save!
            puts "[CONSUMER] Brand created: #{brand.name}"
          else
            puts "[CONSUMER] Brand already exists, skipped: #{brand.slug}"
          end
        end
      rescue => e
        puts "[CONSUMER ERROR] #{e.class}: #{e.message}"
      end

      def start
        subscribe("notifications.queue")
      end
    end
  end
end
