class Country < ApplicationRecord
  has_many :states, dependent: :destroy

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "must contain only letters" }
end