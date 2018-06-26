class UserNotifierMailer < ApplicationMailer
   
    default :from => 'satveer@mail.com'

    def send_notification(user, book)
        puts 'Send notification start'
        @user = user
        @book = book
        mail( :to => @user.email,
        :subject => 'Notification email test' )
        puts 'Send notification end'
    end
end
