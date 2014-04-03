class User < ActiveRecord::Base

  has_many :needs
  has_many :cabins, :through => :visits
  has_many :visits
  has_many :supplies

  has_secure_password
end
