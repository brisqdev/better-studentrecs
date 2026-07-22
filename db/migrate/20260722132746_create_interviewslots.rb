class CreateInterviewslots < ActiveRecord::Migration[8.1]
  def change
    create_table :interviewslots do |t|
      t.datetime :slot_datetime
      t.string :slot_academy
      t.integer :slot_capacity
      t.integer :slot_assigned

      t.timestamps
    end
  end
end
