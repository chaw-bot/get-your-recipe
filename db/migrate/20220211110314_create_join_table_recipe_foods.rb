class CreateJoinTableRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    def change
      create_table :foods_recipes do |t|
  
        t.references :food, null: false, foreign_key: true
        t.references :recipe, null: false, foreign_key: true
        t.integer :quantity
  
        t.timestamps
      end
    end
  end
end
