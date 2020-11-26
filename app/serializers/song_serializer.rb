class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :image, :preview, :spotify_id
end
