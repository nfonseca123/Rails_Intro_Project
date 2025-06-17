class State < ApplicationRecord
  belongs_to :country
  has_many :users, dependent: :destroy

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "must contain only letters" }
  validates :country_id, presence: true, format: { with: /\A\d+\z/, message: "must contain only numbers" }
end