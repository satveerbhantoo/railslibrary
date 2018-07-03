module Api
    class ApiBooksController < BaseApiController
        before_action :authenticate_request!
        protect_from_forgery unless: -> { request.format.json? }
        skip_before_filter :verify_authenticity_token 

        def index 
            render json: Book.limit(10) ##
        end

        def create
            puts 'params are: ' 

            params[:books].each do |book|
                params2 = ActionController::Parameters.new({
                    :book => book
                })  
                
                permitted = params2.require(:book).permit(:name, :synopsis, :publisher, :published_date, :library_id)
                puts permitted.permitted?

                Book.new(permitted).save
            end
        end

        def show
            book = Book.find(params[:id])
            render json: {error: 'Book not found'}, status: 400 && return if book.nil?
            render json: book
        end

        def destroy
            book = Book.find(params[:id])
            book.destroy
        end

        private
            def book_params
                p 'BOOK'
                p params.class
                # params.require(:book).permit(:name, :synopsis, :publisher, :published_date, :library_id)
            end
    end
end
