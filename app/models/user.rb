class User < ActiveRecord::Base
  # has_secure_password
  after_create :generate_token

  def generate_token
    self.token = SecureRandom.hex
    self.save
  end
end
