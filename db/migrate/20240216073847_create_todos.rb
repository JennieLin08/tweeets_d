class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.boolean :status
      t.string :remarks
      t.integer :user_id

      t.timestamps
    end
  end
end
