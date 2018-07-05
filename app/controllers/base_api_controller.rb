class BaseApiController < ApplicationController

    ##before_action :parse_request, :authenticate_user_from_token!
    # skip_before_action :verify_authenticity_token  
    
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
            @json = JSON.parse(request.body)
        end

    attr_reader :current_user

    protected
    def authenticate_request!
        unless user_id_in_token?
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        return
        end
        @current_user = User.find(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
    
    private
    def http_token
        @http_token ||= if request.headers['Authorization'].present?
            request.headers['Authorization'].split(' ').last
        end
    end
    
    def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
    end
    
    def user_id_in_token?
        http_token && auth_token && auth_token[:user_id].to_i
    end
end
