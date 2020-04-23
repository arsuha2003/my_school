class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :grade_levels

  belongs_to :user
  validates :user, presence: true

  delegate :full_name, :short_name, to: :user

  scope :ordered, -> { order(:snils) }   
end
