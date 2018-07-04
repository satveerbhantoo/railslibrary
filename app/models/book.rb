class Book < ApplicationRecord
    belongs_to :library
    belongs_to :user, optional: true
    has_many :comments
    has_many :book_categories, :class_name => 'BookCategory'
    has_many :categories, :through => :book_categories, :class_name => 'Category'
    has_many :logs

    after_save :create_log, if: proc { self.is_borrowed_changed? }
    after_save :send_mail, if: proc { self.is_borrowed_changed? }


    def create_log
        self.logs.create do |log|
            log.user_id = self.user_id
            if self.is_borrowed?
                log.log_details = 'Book was borrowed by user'
                log.log_type = 'borrowed'
            else
                log.log_details = 'Book was returned by user'
                log.log_type = 'returned'
            end

            log.date_added = DateTime.now
        end
    end

    def send_mail
        if self.is_brrowed? 
            UserNotifierMailer.delay.send_notification self.user, self
        end
    end

end
