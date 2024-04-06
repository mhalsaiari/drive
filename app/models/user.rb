class User < ApplicationRecord
    has_secure_password
    
    
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }

    def self.authenticate(email, password)
        user = find_by(email: email)
        return user if user && user.authenticate(password)
     end
      
  end
  