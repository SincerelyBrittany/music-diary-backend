class Api::V1::CommentsController < ApplicationController

    def index
        @comments = Entry.find(params[:entry_id]).comments
        # render json: @comments
        # @comments = Entry.find(3).comments
        render json: CommentSerializer.new(@comments).to_serialized_json
    end 

    def create
        byebug
    end 

    def show
        byebug
    end 
end
