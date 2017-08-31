class Mentorship < ApplicationRecord
  belongs_to :mentor
  belongs_to :cohort

  validates :mentor_id, presence: true, numericality: true
  validates :cohort_id, presence: true, numericality: true
end
