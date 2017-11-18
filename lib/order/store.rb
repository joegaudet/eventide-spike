class Order
  class Store
    include EntityStore

    category :order
    entity Order
    projection Order::Projection
    reader MessageStore::Postgres::Read
  end
end
