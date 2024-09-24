class Club < ApplicationRecord
  belongs_to :tennis_school

  validates :uuid, :name, presence: true

  before_validation :set_uuid

  private

  def set_uuid
    self.uuid = name.downcase.parameterize(separator: '-')
  end
end
