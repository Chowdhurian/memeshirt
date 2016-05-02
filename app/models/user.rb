class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :subscriptions

  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'does not appear to be valid' }
  validates :password_hash, presence: true, length: { minimum: 6 }


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
