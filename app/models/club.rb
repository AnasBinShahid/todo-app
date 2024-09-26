class Club < ApplicationRecord
  has_many :lesson_packages, dependent: :destroy
  belongs_to :tennis_school

  validates :uuid, :name, presence: true

  before_validation :set_uuid

  private

  def set_uuid
    self.uuid = name.downcase.parameterize(separator: '-')
  end
end
