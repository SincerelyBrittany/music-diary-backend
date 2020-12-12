class Api::V1::EntriesController < ApplicationController

    def index
        @entries = Entry.all
        # render json: entries.to_json
        render json: EntrySerializer.new(@entries).to_serialized_json
    end 

    # def show
    #     byebug
    
    # end 

    def get_user_entries
        user_entry = Entry.where(user_id: params[:user])
        render json: EntrySerializer.new(user_entry).to_serialized_json
    end 

    def create
        @current_Time = DateTime.now.strftime("%Y/%m/%d")
        song = params[:song]
        @entry = Entry.new(song_id: song[:song_id], user_id: song[:user_id], date: @current_Time, description: song[:description])
        if @entry.save
            render json: @entry
        else
            render json: { errors: @entry.errors.full_messages.to_sentence} 
        end
      end 
  
  
      private 
      def entry_params
        params.require(:song).permit(:song_id, :user_id, :description)
      end
end
