class Task
  module Start
    def self.call
      Order::Consumers::Events.start('order')

      DataCommand::Consumer.start('orderData')
    end
  end
end
