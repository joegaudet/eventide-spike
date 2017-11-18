class Order
  class Projection
    include EntityProjection

    entity_name :order

    apply Messages::Events::Created do |added|
      order.id = added.order_id
    end
  end
end
