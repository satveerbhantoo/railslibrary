class CommentsController < ApplicationController


    def create
        puts '>> comment.create start'
        puts params
        c_to_insert =  Comment.new(comment_params)
        c_to_insert.user_id = current_user.id
        c_to_insert.save
        puts '>> comment.create end'
        redirect_back fallback_location: root_path
    end

    private
        def comment_params
            params.require(:comment).permit(:comment_body, :book_id)
        end
end
