# class EntrySerializer < ActiveModel::Serializer
#   attributes :id
#   belongs_to :user, serializer: UserSerializer
#   belongs_to :song
# end

class EntrySerializer
  def initialize(entry_obj)
    @entry_obj = entry_obj
  end 

  def to_serialized_json
    @entry_obj.to_json(:only => [:id, :description, :user_id, :song_id], methods: :update_date, 
    :include => {
        # :entry => {:only => [:name, :description], methods: :time_updated},
        :song => {:only => [:name, :id, :artist, :image, :preview, :spotify_id, :lyrics]},
        :user => {:only => [:username]}
    })
  end 
end 