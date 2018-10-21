class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :address
      t.integer :student
      t.integer :class_num
      t.float :fee
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :schools, [:user_id, :created_at]
  end
end
