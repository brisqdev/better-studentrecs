class CreateCounselors < ActiveRecord::Migration[8.1]
  def change
    create_table :counselors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :school_name

      t.timestamps
    end
  end
end
