class User < ApplicationRecord
  belongs_to :state

  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email address" }
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "must contain only letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "must contain only letters" }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
  validates :state_id, presence: true
end