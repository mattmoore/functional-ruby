require 'benchmark'
require 'active_support/inflector'

# Regular add
def f(x, y)
  x + y
end

# Simple curried form. This allows us to chain single parameters as separate function calls.
def g(x)
  -> (y) { f(x, y) }
end

# Recursive curried form. We can recursively call the method to add additional values. We still maintain single arity.
def h(x)
  -> (y = nil) { y ? h(f(x, y)) : x }
end

examples = {
  boring:            f(2, 3),
  curried:           g(2).(3),
  recursive_curried: h(2).(3).(1).call
}

examples.keys.each do |example|
  result = nil
  benchmark = Benchmark.measure { result = examples[example] }
  puts "#{example.to_s.titleize}:".ljust(20) + "#{result} #{benchmark}"
end
