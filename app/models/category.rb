class Category < ApplicationRecord
    has_many :book_categories, :class_name => 'BookCategory'
    has_many :books, :through => :book_categories, :class_name => 'Book'
end
