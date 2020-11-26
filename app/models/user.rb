class User < ApplicationRecord
    has_secure_password
    validates :username, :email, presence: true,  uniqueness: { case_sensitive: false }
    
    has_many :entries, dependent: :destroy
    has_many :songs, through: :entries
    
    has_many :comments, dependent: :destroy
end
