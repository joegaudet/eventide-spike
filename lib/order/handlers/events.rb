class Order
  module Handlers
    class Events
      include Messaging::Handle
      include Messaging::StreamName

      include Messages::Events

      dependency :write, Messaging::Postgres::Write
      dependency :get_last, MessageStore::Postgres::Get::Last

      def configure
        Messaging::Postgres::Write.configure(self)
        MessageStore::Postgres::Get::Last.configure(self)
      end

      category :task_data

    end
  end
end
