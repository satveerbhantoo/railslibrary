class Log < ApplicationRecord
    belongs_to :book
    belongs_to :user

    def log_message
        "The log detail is: " + "#{log_details}" 
    end
end
