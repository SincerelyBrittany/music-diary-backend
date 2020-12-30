class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :song
    has_many :comments, dependent: :destroy

    validates :date, presence: true
    validates :description, presence: true

    validates_uniqueness_of :user_id, :scope => :date

    def update_date
        date.strftime("%A, %b %e, %Y")
    end

    def time_updated
        self.time.strftime("%I:%M:%S %p")
     end
end
