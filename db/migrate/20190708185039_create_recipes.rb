class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :source_url
      t.string :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end
