class TennisSchool < ApplicationRecord
  has_many :clubs, dependent: :destroy
  has_one_attached :logo

  validates :name, presence: true
end
