require 'benchmark'
require 'active_support/inflector'

class Array
  def myreduce(accumulator, &f)
    each do |x|
      accumulator = f.(accumulator, x)
    end
    accumulator
  end
end

collection = (1..3).to_a

examples = {
  myreduce: collection.myreduce(0) { |accumulator, x| accumulator += x }
}

examples.keys.each do |example|
  result = nil
  benchmark = Benchmark.measure { result = examples[example] }
  puts "#{example.to_s.titleize}:".ljust(20) + "#{result} #{benchmark}"
end
