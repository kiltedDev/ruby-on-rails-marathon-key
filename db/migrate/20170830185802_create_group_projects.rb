class CreateGroupProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :group_projects do |t|
      t.string :group_name, null: false
      t.string :project_name, null: false
      t.timestamps
    end
  end
end
