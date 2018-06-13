class BooksController < ApplicationController

    protect_from_forgery prepend: true
    ##Authenticity token error fix

    def index
        ##retrieve list of libraries available for dropdown
        @libraries = fetch_libraries

        if params[:is_mine] != nil
            @is_mine = params[:is_mine]
        else 
            @is_mine = false
        end
        
        puts current_user.id
        if params[:is_mine]
            @books = Book.where(user_id: current_user.id)
        else
            @books = Book.where(is_borrowed: false)
        end
        
        if params[:keywords] != nil
            @keywords = params[:keywords]
            @books = @books.where("name like ?", '%'+ params[:keywords]+ '%')
        end


        if params[:library_id] != nil
            @current_library = params[:library_id]
            @books = @books.where({library_id: params[:library_id]}) 
            
        end
    
        
    end

    def fetch_libraries
        Library.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def borrow
        @book = Book.find(params[:book_id])
        @book.is_borrowed =  true
        @book.user = current_user
        @book.save
        Log.new(book_id: @book.id, log_details: "Book was borrowed by user", log_type: "user_borrowed_book", date_added: DateTime.now, user_id: current_user.id).save
        UserNotifierMailer.send_notification(current_user).deliver_later(wait: 10.seconds)
        redirect_to request.referrer, notice: "You're being redirected"
        #Todo: Update user log

        
    end

    def return
        @book = Book.find(params[:book_id])
        @book.is_borrowed = false
        @book.user = nil
        @book.save
        Log.new(book_id: @book.id, log_details: "Book was returned by user", log_type: "user_returned_book", date_added: DateTime.now, user_id: current_user.id).save
        redirect_to request.referrer, notice: "You're being redirected"
    end

    def search
        puts ">>>Searching Book<<<"
        
        puts ">>>End searching book<<<"
    end
end
