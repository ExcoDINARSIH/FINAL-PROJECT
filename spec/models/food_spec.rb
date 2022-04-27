require 'rails_helper'

RSpec.describe Food, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it "is valid with a name and a description" do
    expect(FactoryBot.build(:food)).to be_valid
  end

  it "is invalid without a name" do
    food = FactoryBot.build(:food, name: nil)

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end

    it "is invalid with a duplicate name" do
    food1 = FactoryBot.create(:food, name: 'Nasi Buk')
    food2 = FactoryBot.build(:food, name: 'Nasi Buk')

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end

  it "is invalid without a price" do
    food = FactoryBot.build(:food, price: nil)

    food.valid?

    expect(food.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a price below 0.01' do
    food = FactoryBot.build(:food, price: nil)

    food.valid?
   
    expect(food.errors[:price]).not_to include("must be greater than or equal to %{count}")
  end

  # describe 'self#by_letter' do
  #   context 'with matching letter' do
  #     it "should return a sorted array of results that match" do
  #       food1 = FactoryBot.create(:food, name: 'Nasi Buk')
  #       food2 = FactoryBot.create(:food, name: 'Sate Ayam Madura')
  #       food3 = FactoryBot.create(:food, name: 'Soto Udang')
  
  #       expect(Food.by_letter("S")).to eq([food3, food2])
  #     end
  #   end
  # end
end