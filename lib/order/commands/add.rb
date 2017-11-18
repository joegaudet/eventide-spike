class Order
  module Commands
    class Create
      attr_reader :order_id
      attr_reader :name

      dependency :clock, Clock::UTC
      dependency :store, Task::Store
      dependency :write, Messaging::Postgres::Write

      def initialize(order_id, name)
        @order_id = order_id
        @name = name
      end

      def self.build(name, order_id: nil)
        order_id ||= Identifier::UUID::Random.get

        instance = new(order_id, name)
        Clock::UTC.configure(instance)
        Store.configure(instance)
        Messaging::Postgres::Write.configure(instance)
        instance
      end

      def self.call(name, order_id: nil)
        instance = build(name, order_id: order_id)
        instance.()
      end

      def call
        order, version = store.get(order_id, include: :version)

        return unless order.nil?

        added = Messages::Events::Created

        added.order_id = order_id
        stream_name = "order-#{order_id}"

        write.(added, stream_name, expected_version: version)

        added
      end
    end
  end
end
