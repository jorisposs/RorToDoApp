class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.date :start_date
      t.date :end_date
      t.integer :priority
      t.text :description
      t.boolean :status

      t.timestamps null: false
    end
  end
end
