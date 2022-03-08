class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true
  validates_presence_of :password_confirmation, require: true

  has_secure_password
end
