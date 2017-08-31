class Cohort < ApplicationRecord
  has_many :students
  has_many :mentorships
  has_many :mentors, through: :mentorships
  has_many :group_projects

  validates :name, presence: true
  validates :launch_site, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }

end
