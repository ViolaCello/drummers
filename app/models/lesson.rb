class Lesson < ActiveRecord::Base
    has_many :goals
    has_many :drummers, through: :goals
    
end