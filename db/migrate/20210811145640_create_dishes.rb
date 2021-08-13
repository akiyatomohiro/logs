class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.float :portion
      t.text :tips
      t.text :reference
      t.integer :required_time
      t.integer :popularity
      t.text :cook_memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :dishes, [:user_id, :created_at]
  end
end
