class Diagnoses < ApplicationRecord
    has_many :answer

    validates :answer, presence: true
    validates :answer, uniqueness: true
end
