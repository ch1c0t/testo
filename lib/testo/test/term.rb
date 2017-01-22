class Testo::Test
  class Term
    def initialize id = object_id, &block
      @id, @block = id, block
    end

    attr_reader :queue, :id

    private def initialize_copy _original
      super
      @queue = Queue.new
    end

    Message = -> message { message[:to] == :term }

    def check
      new_term = clone

      fork do
        begin
          @block.call
          message = {status: :passed, object_id: new_term.object_id}
        rescue Exception
          message = {
            status:     :failed,
            object_id:  new_term.object_id,
            exception:  $!
          }
        ensure
          put message
        end
      end

      new_term
    end

    def debug
      require 'pry-byebug'
      @block.binding.pry
    end

    def ok?
      receive_message unless @message_is_received
      not @exception
    end

    private

    def receive_message
      message = @queue.pop
      @exception = message[:exception]
      @message_is_received = true
    end

    def put message
      default = { to: :term }
      Process.ppid.put message.merge default
    end
  end
end
