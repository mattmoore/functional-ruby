require_relative '../composition.rb'

include Composition

RSpec.describe 'Composition' do
  let(:doubler) { ->(x) { x * 2 } }
  it 'composes functions' do
    expect(compose(doubler, doubler, doubler).(2)).to eq (16)
  end
end
