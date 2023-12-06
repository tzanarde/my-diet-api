class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :description
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
