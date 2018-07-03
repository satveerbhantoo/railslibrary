class BooksController < ApplicationController

    protect_from_forgery prepend: true
    ##Authenticity token error fix

    def index
        ##retrieve list of libraries available for dropdown
        @libraries = fetch_libraries

        ##Verify if viewing borrowed book or genral listing
        if !params[:is_mine].blank?
            @books = Book.where(user_id: current_user.id)
        else 
            @books = Book.unborrowed
        end 
        
        #Check whether Must search or not?
        if params[:keywords] != nil
            @keywords = params[:keywords]
            @books = @books.where("name like ?", '%'+ params[:keywords]+ '%')
        end

        #Filtering by libraries
        puts 'Filter by libraries'
        if !params[:library_id].blank?
            puts 'inside library filter'
            @books = @books.where({library_id: params[:library_id]}) 
        end

        # @books = @books.paginate(page: params[:page], per_page: 4)
     
    end


    ##Retrieve libraries for dropdown
    def fetch_libraries
        Library.limit(10)
    end

    def show
        @book = Book.find(params[:id])
        @comments = Comment.where(book_id: params[:id]).includes(:user) 
    end

    ##Action for borrow a book
    def borrow
        @book = Book.find(params[:book_id])
        @book.is_borrowed =  true
        @book.user = current_user
        @book.save
        Log.new(book_id: @book.id, log_details: "Book was borrowed by user", log_type: "user_borrowed_book", date_added: DateTime.now, user_id: current_user.id).save
        UserNotifierMailer.delay.send_notification current_user, @book
        redirect_to request.referrer, notice: "You're being redirected"
        #Todo: Update user log   
    end

    ##User returning a book
    def return
        @book = Book.find(params[:book_id])
        @book.is_borrowed = false
        @book.user = nil
        @book.save
        Log.new(book_id: @book.id, log_details: "Book was returned by user", log_type: "user_returned_book", date_added: DateTime.now, user_id: current_user.id).save
        redirect_to request.referrer, notice: "You're being redirected"
    end
    

end
