module Testo
  class Test
    def initialize
      @terms = []
      instance_eval &Proc.new
    end

    def [] object
      @it = object
      Report.new @terms.map &[]
    end

    def ok? object
      check(object).all? &:ok?
    end

    private
      attr_reader :it

      def term id = nil, &block
        term = Term.new *id, &block
        @terms << term
      end

      def assert
        fail unless yield
      end
  end
end

require_relative 'test/term'
require_relative 'test/report'
