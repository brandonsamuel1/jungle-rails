RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be invalid with no value for name' do
      @category = Category.create!(name: 'a')
      @product = Product.new(category: @category)
      expect(@product).to_not(be_valid)
      expect(@product.errors[:name]).to(include("can't be blank"))
    end
    it 'should be invalid with no value for price' do
      @category = Category.create!(name: 'a')
      @product = Product.new(category: @category)
      expect(@product).to_not(be_valid)
      expect(@product.errors[:price]).to(include("is not a number"))
    end
    it 'should be invalid with no value for quantity' do
      @category = Category.create!(name: 'a')
      @product = Product.new(category: @category)
      expect(@product).to_not(be_valid)
      expect(@product.errors[:quantity]).to(include("is not a number"))
    end
    it 'should be invalid with no value for category' do
      @category = Category.create!(name: 'a')
      @product = Product.new(category: @category)
      expect(@product).to_not(be_valid)
      expect(@product.errors[:category])
    end
  end
end