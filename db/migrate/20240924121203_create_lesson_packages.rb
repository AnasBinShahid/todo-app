class CreateLessonPackages < ActiveRecord::Migration[7.1]
  def change
    create_table :lesson_packages do |t|
      t.references :club, null: false, foreign_key: true
      t.string :name, null: false
      t.date :start_date
      t.text :description, null: false
      t.decimal :costs
      t.boolean :open_for_registration, default: true
      t.date :register_by
      t.date :register_up_to_and_including
      t.integer :number_of_teaching_weeks, null: false
      t.integer :number_of_minutes_per_lesson, null: false
      t.integer :lessons_per_week
      t.bigint :max_number_of_players
      t.bigint :min_number_of_players
      t.bigint :optimal_number_of_players
      t.bigint :max_number_of_impediments

      t.timestamps
    end
  end
end
