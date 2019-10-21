require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should validates :name, presence: true' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.create!({
        name:  'Men\'s Classy shirt',
        description: 'description',
        quantity: 10,
        price: 64.99,
        category: cat1
      })
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present
    end
    it 'should validates :description, presence: true' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.create!({
        name:  'Men\'s Classy shirt',
        description: 'description',
        quantity: 10,
        price: 64.99,
        category: cat1
      })     
      expect(@product.price).to be_present
    end
    it 'should validates :quantity, presence: true' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.create!({
        name:  'Men\'s Classy shirt',
        description: 'description',
        quantity: 10,
        price: 64.99,
        category: cat1
      })
      expect(@product.quantity).to be_present
    end
    it 'should validates :category, presence: true' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.create!({
        name:  'Men\'s Classy shirt',
        description: 'description',
        quantity: 10,
        price: 64.99,
        category: cat1
      })
      expect(@product.category).to be_present
    end
    it 'should validates :fields, presence: nil' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.create!({
        description: 'description',
        quantity: 10,
        price: 64.99,
        category: cat1
      })
      if @product.errors.any?
        @product.errors.full_messages.each do |message|
          puts message
        end
      end
      expect(@product.name).to be_nill

    end
  end
end
