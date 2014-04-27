class Cabin < ActiveRecord::Base

  has_many :needs, :dependent => :destroy
  has_many :supplies, :dependent => :destroy
  has_many :users, :through => :visits
  has_many :visits, :dependent => :destroy

  def next_visit(id)
    if Visit.find_by(cabin_id: id).nil?
      return nil
    else
      @visits = Visit.where(:cabin_id => id, :start_date => (Time.now..(Time.now+180.days)))
      visit = @visits.order(:start_date).first
      if visit.nil?
        return nil
      else
        return "Start date: " + visit.start_date.to_s + ", End date: " + visit.end_date.to_s + ", Visitor: " + visit.user_name(visit.user_id)
      end
    end
  end

end
