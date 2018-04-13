require 'benchmark'
require 'active_support/inflector'

class Array
  def mymap(&block)
    xs = []
    each do |x|
      xs << block.call(x)
    end
    xs
  end
end

collection = (1..3).to_a
f = -> (x) { x * 2 }

examples = {
  mymap: collection.mymap{ |x| f.(x) }
}

examples.keys.each do |example|
  result = nil
  benchmark = Benchmark.measure { result = examples[example] }
  puts "#{example.to_s.titleize}:".ljust(20) + "#{result} #{benchmark}"
end
