class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.references :reception, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
