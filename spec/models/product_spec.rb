require 'rails_helper'


RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: 'Apparel')
    end

    it 'should have all parameters' do
      p = Product.create({name: 'abc', description: 'why', 
        category_id: @category.id, quantity: 1, 
      price: 1000}) 
      expect(p).to be_valid
    end

    it 'should not be valid if the name is nil' do
      p = Product.create(name: nil, description: 'why', 
        category_id: @category.id, quantity: 1, 
      price: 1000)
      expect(p.errors.full_messages).to include("Name can't be blank")
    end 
      
    it 'should not be valid if the price is nil' do
      p = Product.create(name: 'a', description: 'why', 
        category_id: @category.id, quantity: 1, 
      price: nil)
      expect(p.errors.full_messages).to include("Price can't be blank")
    end 
    
    it 'should not be valid if the quantity is nil' do
      p = Product.create(name: 'a', description: 'why', 
        category_id: @category.id, quantity: nil, 
      price: 1000)
      expect(p.errors.full_messages).to include("Quantity can't be blank")
    end 

    it 'should not be valid if the category is nil' do
      p = Product.create(name: 'a', description: 'why', 
        category_id: nil, quantity: 1, 
      price: 1000)
      expect(p.errors.full_messages).to include("Category can't be blank")
    end 
  end
end
