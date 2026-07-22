class CreateRecommendations < ActiveRecord::Migration[8.1]
  def change
    create_table :recommendations do |t|
      t.references :teacher, null: false, foreign_key: true
      t.string :recommendation

      t.timestamps
    end
  end
end
