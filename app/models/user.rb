class User < ActiveRecord::Base
  has_many :records

  validates :username, presence: true, uniqueness: true

  has_secure_password
end
