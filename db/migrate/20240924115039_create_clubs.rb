class CreateClubs < ActiveRecord::Migration[7.1]
  def change
    create_table :clubs do |t|
      t.text :uuid, null: false
      t.references :tennis_school, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.decimal :advance_payment_percentage, default: 0.00
      t.decimal :min_advance_amount, default: 0.00
      t.boolean :active, default: false
      t.text :information

      t.timestamps
    end
  end
end
