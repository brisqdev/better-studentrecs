class CreateApplicants < ActiveRecord::Migration[8.1]
  def change
    create_table :applicants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :city_of_residence
      t.string :school_name
      t.references :counselor, null: false, foreign_key: true
      t.references :math_teacher, null: false, foreign_key: { to_table: :teachers }
      t.references :science_teacher, null: false, foreign_key: { to_table: :teachers }
      t.references :english_teacher, null: false, foreign_key: { to_table: :teachers }
      t.string :academy_of_application
      t.boolean :recommendations_uploaded, default: false, null: false
      t.boolean :transcript_uploaded, default: false, null: false
      t.string :application_status
      t.references :testing_slot, null: false, foreign_key: { to_table: :testingslots }
      t.references :interview_slot, null: false, foreign_key: { to_table: :interviewslots }
      t.references :recommendation, null: false, foreign_key: true
      t.references :transcript, null: false, foreign_key: true

      t.timestamps
    end
  end
end
