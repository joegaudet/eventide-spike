class Order
  module Messages
    module Events
      class Created
        include Messaging::Message

        attribute :order_id, String
        attribute :name, String
        attribute :pickup_time, Time
        attribute :delivery_time, Time
      end

      class CartCreated
        include Messaging::Message

        attribute :name, String
        attribute :budget, Integer
      end

      class ItemAdded
        include Messaging::Message

        attribute :item_id, String
        attribute :name, String
        attribute :menu_item_id, String
        attribute :client_price_cents, Integer
        attribute :restaurant_price_cents, Integer
      end

      class ItemRemoved
        include Messaging::Message

        attribute :item_id, String
      end

      class Submitted
        include Messaging::Message

        attribute :order_id, String
      end

      class ApprovedByClient
        include Messaging::Message

        attribute :order_id, String
      end

      class RejectedByClient
        include Messaging::Message

        attribute :order_id, String
      end

      class ApprovedByRestaurant
        include Messaging::Message

        attribute :order_id, String
      end

      class RejectedByRestaurant
        include Messaging::Message

        attribute :order_id, String
      end

      class DriverArrivedAtRestaurant
        include Messaging::Message

        attribute :order_id, String
      end

      class PickedUp
        include Messaging::Message

        attribute :order_id, String
      end

      class DriverEnRouteToClient
        include Messaging::Message

        attribute :order_id, String
      end

      class DriverArrivedAtClient
        include Messaging::Message

        attribute :order_id, String
      end

      class Delivered
        include Messaging::Message

        attribute :order_id, String
      end
    end
  end
end
