class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id, null: false
      t.string :ingredient_name
      t.string :amount

      t.timestamps
    end
  end
end
