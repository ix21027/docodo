class CreateReceptions < ActiveRecord::Migration[6.1]
  def change
    create_table :receptions do |t|
      t.datetime :time
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.boolean :open, null: false, default: true

      t.timestamps
    end
  end
end
