class BookCategory < ApplicationRecord
    belongs_to :book, class_name: 'Book'
    belongs_to :category, class_name: 'Category'
end
