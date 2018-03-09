class User < ApplicationRecord
  # Hash password before saving user
  before_save :encrypt_password
  # Generate an authentication token for the user
  before_create :generate_token
  # Add a virtual password field that we will user when creating a user
  attribute :password, :string
  
  has_many :memos
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user # Authenticated user and will send back found user
    else
      nil  # Either could not find or could not authenticate user
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Generate token for User
  def generate_token
    token_gen = SecureRandom.hex
    self.token = token_gen
    token_gen # Return token
  end
end
