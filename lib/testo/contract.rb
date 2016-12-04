module Testo
  class Contract
    def initialize
      @terms = []
      instance_eval &Proc.new
    end

    def check object
      @it = object
      @terms.map &:check
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

require_relative 'contract/term'
