class GradeLevel < ApplicationRecord
  has_many :grades, dependent: :destroy

  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :teachers

  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 12 }, uniqueness: true
  scope :ordered, -> { order(:level) }
end
