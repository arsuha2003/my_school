class User < ApplicationRecord
  paginates_per 10

  has_one :student, dependent: :nullify
  has_one :parent, dependent: :nullify

  enum sex: %i[female male]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :dob, presence: true, length: { minimum: 10, maximum: 10 }

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  def short_name
    "#{last_name} #{first_name.first}. #{middle_name.first}."
  end
end
