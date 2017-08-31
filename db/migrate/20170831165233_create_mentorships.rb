class CreateMentorships < ActiveRecord::Migration[5.1]
  def change
    create_table :mentorships do |t|
      t.integer :mentor_id, null: false
      t.integer :cohort_id, null: false
    end
  end
end
