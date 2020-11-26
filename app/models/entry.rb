class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :song
    has_many :comments, dependent: :destroy

    validates :date, presence: true
    validates :description, presence: true
end
