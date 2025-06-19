class Country < ApplicationRecord
  has_many :states, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 60, message: "must be between 2 and 60 characters" }
end