class Api::V1::CommentsController < ApplicationController

    def index
        @comments = Entry.find(params[:entry_id]).comments
        # render json: @comments
        # @comments = Entry.find(3).comments
        render json: CommentSerializer.new(@comments).to_serialized_json
    end 

    def create
        user = User.find_by(params[:user_id])
        entry = Entry.find(params[:data][:entry_id])
        content = params[:data][:content]
        @comment = Comment.new(user: user, entry: entry, content: content)
       
        if @comment.save
            render json: CommentSerializer.new(@comment).to_serialized_json
           else 
            render json: { errors: @comment.errors.full_messages.to_sentence} 
        end 
    end 

    def show
        byebug
    end 
end
