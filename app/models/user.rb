class User < ApplicationRecord
  belongs_to :state

  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email address" }
  validates :first_name, presence: true, length: { minimum: 1, maximum: 50, message: "must be between 2 and 50 characters" }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 50, message: "must be between 2 and 50 characters" }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
  validates :state_id, presence: true
end
