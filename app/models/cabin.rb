class Cabin < ActiveRecord::Base

  has_many :needs, :dependent => :destroy
  has_many :supplies, :dependent => :destroy
  has_many :users, :through => :visits
  has_many :visits, :dependent => :destroy

end
