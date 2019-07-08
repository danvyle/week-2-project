class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :description
      t.integer :calorie
      t.integer :recipe_id
      t.timestamps
    end
  end
end
