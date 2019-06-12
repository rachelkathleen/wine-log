class User < ApplicationRecord
  has_many :wines

  validates :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true
  has_secure_password  #password validations

  def self.from_omniauth(auth)
    #Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.user_name = auth.info.name
      user.email = auth.info.email
      if auth.info.uid
        user.uid = auth.info.uid
      end
      user.password = SecureRandom.hex
    end
  end
end
