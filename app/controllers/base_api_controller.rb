class BaseApiController < ApplicationController

    #before_action :parse_request, :authenticate_user_from_token!

    private 
        def authenticate_user_from_token!
            if !@json['api_token']
                render nothing: true, status: :unauthorized 
            else
                @user = nil 
                User.find_each do |u| 
                    if Devise.secure_compare(u.api_token, @json['api_token'])
                        @user = u 
                    end
                end
            end
        end

        def parse_request 
            puts "request body start"
            puts request.body.read
            puts "request body end"
            @json = JSON.parse(request.body.read)
        end
end
