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

  it "is invalid with a duplicate name" do
    food1 = Food.create(
      name: "Nasi Buk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 23000.0
    )
    
    food2 = Food.new(
      name: "Nasi Buk",
      description: "Just with a different description.",
      price: 23000.0
    )

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end
end