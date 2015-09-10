class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password
  
 # Returns a random token.
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  # encrypts token
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
   
  # Remembers a user in the database for use in persistent sessions.
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
  
  # Returns true if the given token matches the digest.
 # def authenticated?(remember_token)
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

end

 
