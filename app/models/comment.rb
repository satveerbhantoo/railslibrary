class Comment < ApplicationRecord
    belongs_to :book
    belongs_to :user

    validates :comment_body, length: { minimum: 2, maximum: 50}
    
end
