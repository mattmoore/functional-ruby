require 'benchmark'
require 'active_support/inflector'

class Array
  def my_filter(&f)
    self.reduce([]) { |xs, x| (xs << x) if f.(x); xs }
  end
end

collection = (1..10).to_a
f = -> (x) { x > 4 }

examples = {
  myfilter: collection.my_filter { |x| x > 4 }
}

examples.keys.each do |example|
  result = nil
  benchmark = Benchmark.measure { result = examples[example] }
  puts "#{example.to_s.titleize}:".ljust(20) + "#{result} #{benchmark}"
end
