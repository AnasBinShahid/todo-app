class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :content, null: false
      t.boolean :completed, null: false, default: false
      t.datetime :remind_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
