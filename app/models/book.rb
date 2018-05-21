class Book < ApplicationRecord
    belongs_to :library
    belongs_to :user, optional: true
    has_many :comments
    has_many :book_categories, :class_name => 'BookCategory'
    has_many :categories, :through => :book_categories, :class_name => 'Category'
end
