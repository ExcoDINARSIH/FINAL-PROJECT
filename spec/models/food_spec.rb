require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a name and a description' do
    food = Food.new(
      name: 'Nasi Buk',
      description: 'Madura special food consist of rice mixed bamboo shoots, fried empal, and jerky.',
      price: 23000.0
    )

    expect(food).to be_valid
  end
end