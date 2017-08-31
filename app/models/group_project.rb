class GroupProject < ApplicationRecord
  belongs_to :cohort
  has_many :students
  has_many :tasks

  validates :group_name, presence: true
  validates :project_name, presence: true
end
