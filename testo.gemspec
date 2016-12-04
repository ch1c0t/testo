Gem::Specification.new do |g|
  g.name    = 'testo'
  g.files   = `git ls-files`.split($/)
  g.version = '0.0.0'
  g.summary = 'A set of primitives from which a powerful test harness can be baked.'
  g.authors = ['Anatoly Chernow']

  g.add_dependency 'tra'

  g.add_development_dependency 'pry'
  g.add_development_dependency 'pry-byebug'
  g.add_development_dependency 'awesome_print'
  g.add_development_dependency 'minitest'
  g.add_development_dependency 'minitest-power_assert'
  g.add_development_dependency 'rake'
  g.add_development_dependency 'simplecov'
end
