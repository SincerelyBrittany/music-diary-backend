class Api::V1::CommentsController < ApplicationController

    def index
        @comments = Entry.find(params[:entry_id]).comments
        render json: @comments
    end 

    def create
        byebug
    end 

    def show
        byebug
    end 
end
