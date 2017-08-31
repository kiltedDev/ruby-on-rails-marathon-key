class Mentor < ApplicationRecord
  has_many :students
  has_many :mentorships
  has_many :cohorts, through: :mentorships

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, numericality: false
  validates :motivation, presence: true
  validates :specialty, presence: true

end
