class Subject < ApplicationRecord
  has_and_belongs_to_many :grade_levels
  has_and_belongs_to_many :teachers

  validates :name, uniqueness: true, presence: true

  scope :ordered, -> { order(:name) }
end
