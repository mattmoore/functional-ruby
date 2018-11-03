module Composition
  def compose(*fns)
    fns.reduce { |f, g| ->(x) { f.(g.(x)) } }
  end
end
