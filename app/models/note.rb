class Note < ApplicationRecord
  enum :status, {
    to_do: 0,
    in_progress: 1,
    completed: 2,
    over_due: 3
  }

  validates :title, :status, :expected_completion_at, presence: true
  validate :completion_duration_valid?

  before_validation :assign_status, on: :create

  private

  def completion_duration_valid?
    return true if actual_completion_at.blank? || actual_completion_at.to_i > expected_completion_at.to_i

    errors.add(:base, 'Actual completion duration is invalid')
  end

  def assign_status
    self.status = 0
  end
end
