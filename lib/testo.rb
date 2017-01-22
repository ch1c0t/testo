require 'tra/run'
require 'to_proc/all'

require 'testo/test'

module Testo
  Thread.new do
    loop do
      begin
        message = Tra.next

        case message
        when Test::Term::Message
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
