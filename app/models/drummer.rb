class Drummer < ActiveRecord::Base
    has_many :goals
    has_many :lessons, through: :goals
    has_secure_password

    validates :password_digest, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
end