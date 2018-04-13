require 'benchmark'
require 'active_support/inflector'

class Array
  def myfilter(&block)
    xs = []
    each do |x|
      xs << x if block.call(x)
    end
    xs
  end
end

collection = (1..8).to_a
f = -> (x) { x % 4 == 0 }

examples = {
  myfilter: collection.myfilter{ |x| f.(x) }
}

examples.keys.each do |example|
  result = nil
  benchmark = Benchmark.measure { result = examples[example] }
  puts "#{example.to_s.titleize}:".ljust(20) + "#{result} #{benchmark}"
end
