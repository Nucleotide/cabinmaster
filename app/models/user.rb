class User < ActiveRecord::Base

  has_many :needs
  has_many :cabins, :through => :needs
  has_many :visits

  has_secure_password
end
