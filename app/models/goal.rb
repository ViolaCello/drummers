class Goal < ActiveRecord::Base
    belongs_to :lesson
    belongs_to :drummer



def self.purge_by_id(drummer) # this removes a drummer's data once account is deleted
    g = Goal.all
    g.map do |i|
        if i.drummer_id == drummer
         i.delete
        end
    end
end

    
end