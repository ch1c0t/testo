term do
  bool = it.ok? Object.new
  assert { bool == true || bool == false }
end

term do
  report = it.check Object.new
  assert { contract[:report].ok? report }
end
