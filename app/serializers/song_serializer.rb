class SongSerializer < ActiveModel::Serializer
  attributes :name, :artist, :image, :preview, :spotify_id, :lyrics
end
