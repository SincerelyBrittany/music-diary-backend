class Song < ApplicationRecord
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries
    

    def self.new_from_spotify_song(spotify_song)
        lyric = Genius::Song.search(spotify_song.name).first.url
        Song.new(
          spotify_id: spotify_song.id,
          name: spotify_song.name,
          artist: spotify_song.artists[0].name,
          image: spotify_song.album.images[0]["url"],
          preview: spotify_song.preview_url,
          lyrics: lyric
        )
    end

    def self.create_from_spotify_song(spotify_song)
        song = self.new_from_spotify_song(spotify_song)
        song.save
        song
    end


end
