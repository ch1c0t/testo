require 'tra/run'

require 'testo/contract'

module Testo
  Thread.new do
    loop do
      begin
        message = Tra.next

        case message
        when Contract::Term::Message
          term = ObjectSpace._id2ref message[:object_id]
          term.queue << message
        end
      rescue
        p $!, $@
        exit!
      end
    end
  end
end
