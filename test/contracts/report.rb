term do
  assert { it.is_a? Enumerable }

  it.each do |term_report|
    assert { contract[:term_report].ok? term_report }
  end
end
