class UserNotifierMailer < ActionMailer::Base
   
    default :from => 'satveer@mail.com'

    def send_notification(user)
        @user = user
        mail( :to => @user.email,
        :subject => 'Notification email test' )
    end
end
