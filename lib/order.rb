class Order
  include Schema::DataStructure

  class Menu
    include Schema::DataStructure

    class Group
      include Schema::DataStructure

      class Item
        include Schema::DataStructure
        attribute :id, String
        attribute :name, String
        attribute :description, String
        attribute :client_price_cents, Integer
        attribute :restaurant_price_cents, Integer
        attribute :available_quantity, Integer
      end

      attribute :id, String
      attribute :name, String
      attribute :description, String
      attribute :name, String
      attribute :items, Hash, default: -> {Hash.new}
    end


    attribute :id, String
    attribute :name, String
    attribute :groups, Hash, default: -> {Hash.new}

  end

  class Contact
    include Schema::DataStructure
    attribute :first_name, String
    attribute :last_name, String
    attribute :email, String
    attribute :phone_number, String
  end

  class Item
    include Schema::DataStructure
    attribute :id, String
    attribute :menu_item_id, String
    attribute :name, String
    attribute :description, String
    attribute :quantity, Integer
    attribute :client_price_cents, Integer
    attribute :restaurant_price_cents, Integer
  end

  class Cart
    include Schema::DataStructure
    attribute :id, String
    attribute :name, String
    attribute :items, Item
  end

  attribute :id, String
  attribute :state, String
  attribute :event_name, String

  # delivery_information
  attribute :deliver_at, Time
  attribute :delivery_address, String

  # pickup information
  attribute :pickup_at, Time
  attribute :pickup_address, String

  attribute :menu, Menu
  attribute :contact, Contact
  attribute :owner, Contact
  attribute :carts, Hash, default: -> {Hash.new}

  # Notes
  attribute :client_notes, String

end


