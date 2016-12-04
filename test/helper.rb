if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'minitest'
require 'minitest-power_assert'
require 'minitest/autorun'

require 'testo'
include Testo
