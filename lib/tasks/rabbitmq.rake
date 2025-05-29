namespace :rabbitmq do
  desc "Start NotificationConsumer"
  task start_notification_consumer: :environment do
    consumer = Rabbitmq::Consumers::NotificationConsumer.new
    puts "NotificationConsumer started"
    consumer.start
  end
end
