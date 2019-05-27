class User < ApplicationRecord
  has_many :wines

  validates :user_name, :email, presence: true
  validates :user_name, :email, uniqueness: true
  has_secure_password  #password validations
end
