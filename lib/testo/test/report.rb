class Testo::Test
  class Report
    def initialize musts
      @musts = musts
    end

    def ok?
      @musts.all? &:ok?
    end

    include Enumerable
    extend Forwardable
    delegate [:each, :[], :size] => :@musts
  end
end
