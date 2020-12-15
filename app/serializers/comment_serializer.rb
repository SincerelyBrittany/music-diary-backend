class CommentSerializer < ActiveModel::Serializer
  # attributes :id
    def initialize(comment_obj)
      @comment_obj = comment_obj
    end 
  
    def to_serialized_json
      @comment_obj.to_json(:only => [:id, :content, :user_id, :entry_id],
      :include => {
          # :entry => {:only => [:name, :description], methods: :time_updated},
          :entry => {:only => [:description, :song]},
          :user => {:only => [:username]}
      })
    end 
 
end
