class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates :user_id, presence: true
  validates :gender, presence: true
  validates :size, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true
end
