class CreateCohorts < ActiveRecord::Migration[5.1]
  def change
    create_table :cohorts do |t|
      t.string :name, null: false
      t.string :launch_site, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
