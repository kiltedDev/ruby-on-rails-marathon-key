class CreateAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :mentor_id, :integer
    add_column :students, :cohort_id, :integer
    add_column :students, :group_project_id, :integer
    add_column :group_projects, :cohort_id, :integer
    add_column :tasks, :student_id, :integer
    add_column :tasks, :group_project_id, :integer

  end
end
