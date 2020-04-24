class Grade < ApplicationRecord
  paginates_per 10

  belongs_to :grade_level

  has_many :student, dependent: :nullify

  validates :letter, presence: true, length: { in: 1..2 }, uniqueness: { scope: :grade_level }
  validates :grade_level, presence: true

  def name
    "#{grade_level.level}-#{letter}"
  end
end
