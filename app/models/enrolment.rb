class Enrolment < ApplicationRecord
    belongs_to :authors
    belongs_to :courses
    
end
