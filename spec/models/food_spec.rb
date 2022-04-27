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

  it 'is invalid without a name' do
    food = Food.new(
      name: nil,
      description: 'Madura special food consist of rice mixed bamboo shoots, fried empal, and jerky.',
      price: 23000.0
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end
end