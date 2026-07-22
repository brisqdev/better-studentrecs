class CreateTranscripts < ActiveRecord::Migration[8.1]
  def change
    create_table :transcripts do |t|
      t.references :counselor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
