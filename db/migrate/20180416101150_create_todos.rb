class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :content, null: false
      t.integer :order, null: false
      t.boolean :is_done, default: false
      t.date :expiration_date
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
