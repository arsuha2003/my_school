class Parent < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :students

  delegate :full_name, :short_name, to: :user

  scope :ordered, -> { order(:full_name) }
end
