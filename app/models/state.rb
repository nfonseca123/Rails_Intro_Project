class State < ApplicationRecord
  belongs_to :country
  has_many :users, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 60, message: "must be between 2 and 60 characters" }
  validates :country_id, presence: true, format: { with: /\A\d+\z/, message: "must contain only numbers" }
end