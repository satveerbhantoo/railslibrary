class BooksController < ApplicationController

    protect_from_forgery prepend: true
    ##Authenticity token error fix

    def index
        ##retrieve list of libraries available for dropdown
        @libraries = fetch_libraries
        @book_categories = fetch_categories 

        ##Verify if viewing borrowed book or genral listing
        if !params[:is_mine].blank?
            @books = Book.where(user_id: current_user.id)
            @is_mine = true
        else 
            @books = Book.where(is_borrowed: false).includes(:categories).limit(20)
            @is_mine = false
        end 
        
        #Check whether Must search or not?
        if params[:keywords] != nil
            @keywords = params[:keywords]
            @books = @books.where("name like ?", '%'+ params[:keywords]+ '%')
        end

        if params[:categories_id] != nil 
            puts 'categoryids'
            puts params[:categories_id]
        end

        #Filtering by libraries
        puts 'Filter by libraries'
        if !params[:library_id].blank?
            puts 'inside library filter'
            @current_library = params[:library_id]
            @books = @books.where({library_id: params[:library_id]}) 
        end

        # @books = @books.paginate(page: params[:page], per_page: 4)
     
    end


    ##Retrieve libraries for dropdown
    def fetch_libraries
        Library.limit(10)
    end

    #fetch book categories
    def fetch_categories
        p 'fetching categories'
        @categories = Category.limit(100)
        p 'categories fetched'
        p @categories
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
        redirect_to request.referrer, notice: "You're being redirected"
        #Todo: Update user log   
    end

    ##User returning a book
    def return
        @book = Book.find(params[:book_id])
        @book.is_borrowed = false
        @book.user = nil
        @book.save
        redirect_to request.referrer, notice: "You're being redirected"
    end

end
