class Task < ApplicationRecord
  belongs_to :student
  belongs_to :group_project

  validates :name, presence: true
  validates :description, presence: true

end
