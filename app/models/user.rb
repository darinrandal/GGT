class User < ActiveRecord::Base
  attr_accessible :banned, :email, :password, :password_confirmation, :username
  has_secure_password

  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, length: { maximum: 26, minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end