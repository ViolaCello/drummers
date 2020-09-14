class Drummer < ActiveRecord::Base
    has_many :goals
    has_many :lessons, through: :goals
    has_secure_password


end