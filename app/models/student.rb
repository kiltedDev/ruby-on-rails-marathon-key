class Student < ApplicationRecord
  belongs_to :mentor
  belongs_to :cohort
  belongs_to :group_project
  has_many :tasks

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :nickname, numericality: false
  validates :motivation, presence: true
  validates :backstory, presence: true

end
