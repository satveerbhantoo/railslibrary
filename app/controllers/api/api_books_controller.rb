module Api
    class ApiBooksController < BaseApiController
        skip_before_action :verify_authenticity_token

        def index 
            render json: Book.all 
        end

        def create
            puts 'params are: ' 
            book = Book.new()
            book.name = params[:name]
            book.synopsis = params[:synopsis]
            book.publisher = params[:publisher]
            book.published_date = params[:published_date]
            book.library_id = params[:library_id]
            book.is_borrowed = false

            puts 'End params'

            #saving
            book.save
        end

        def show
            book = Book.find(params[:id])
            render json: book
        end

    end
end
