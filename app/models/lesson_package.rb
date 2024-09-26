class LessonPackage < ApplicationRecord
  belongs_to :club

  validates :name, :description, :number_of_teaching_weeks, :number_of_minutes_per_lesson, presence: true
end
