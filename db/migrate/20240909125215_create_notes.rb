class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.text :description
      t.bigint :status, null: false
      t.datetime :expected_completion_at
      t.datetime :actual_completion_at

      t.timestamps
    end
  end
end
