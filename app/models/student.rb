class Student < ApplicationRecord
  belongs_to :user

  has_one :parent, dependent: :nullify

  belongs_to :grade

  has_and_belongs_to_many :parents

  delegate :full_name, :short_name, to: :user
end
