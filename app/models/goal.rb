class Goal < ActiveRecord::Base
    belongs_to :lesson
    belongs_to :drummer
end