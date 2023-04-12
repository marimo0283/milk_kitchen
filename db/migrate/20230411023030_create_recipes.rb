class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.string :name
      t.text :introduction
      t.integer :serving

      t.timestamps
    end
  end
end
