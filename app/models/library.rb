class Library < ApplicationRecord
    has_many :books
    validates :name, presence: true, length: {minimum: 4, too_short: 'The library name should be more than 4 characters'}
end
