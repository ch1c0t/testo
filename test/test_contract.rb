require_relative 'helper'

describe Contract do
  before do
    @contract = Contract.new do
      term 'which changes the state' do
        it.instance_eval do
          def hello *args
            "Hello, #{args.join ' '}."
          end
        end

        greeting = it.hello 'gentle', 'readers'
        assert { greeting == 'Hello, gentle readers.' }
      end

      term 'which asserts that no state has been changed' do
        assert { not it.respond_to? :hello }
      end

      term 'which is doomed to fail' do
        it.has_no_such_a_method
      end

      term 'with a wrong assertion' do
        assert { 0 == 1 }
      end
    end
  end

  describe 'bare Object instance' do
    before do
      @terms = @contract.check Object.new
    end

    it 'basic' do
      assert { @terms.size == 4 }

      failed_terms = @terms.reject &:ok?
      assert { failed_terms.size == 2 }

      assert { failed_terms[0].id == 'which is doomed to fail' }
      assert { failed_terms[1].id == 'with a wrong assertion' }
    end
  end
end
