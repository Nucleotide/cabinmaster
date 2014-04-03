class Cabin < ActiveRecord::Base

  has_many :needs, :dependent => :destroy
  has_many :supplies, :dependent => :destroy
  has_many :users, :through => :visits
  has_many :visits, :dependent => :destroy

  def all_visits
    visit = Visit.first
    return "Start date " + visit.start_date.to_s + " End date " + visit.end_date.to_s + " Visitor " + visit.user_name(visit.user_id)
  end

end
