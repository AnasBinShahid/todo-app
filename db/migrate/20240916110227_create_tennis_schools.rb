class CreateTennisSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :tennis_schools do |t|
      t.string :name, null: false
      t.text :description
      t.string :email
      t.string :phone_number
      t.boolean :active
      t.boolean :show_clubs

      t.timestamps
    end
  end
end
