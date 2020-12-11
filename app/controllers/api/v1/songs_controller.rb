class Api::V1::SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    end

    def search
        s_songs = RSpotify::Track.search(params[:search])
        @songs = s_songs.map do |s_song|
          Song.new_from_spotify_song(s_song) 
        end
      render json: @songs
      # render json: { songs: SongSerializer.new(@songs) }
    end

    def create
      @song = Song.new(song_params)
      if @song.save
          render json: @song
      else
          render json: { errors: user.errors.full_messages.to_sentence} 
      end
    end 


    private 
    def song_params
      params.require(:song).permit(:name, :artist, :image, :preview, :spotify_id, :lyrics)
    end

end
