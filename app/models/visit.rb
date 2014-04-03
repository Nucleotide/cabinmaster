class Visit < ActiveRecord::Base

  belongs_to :user
  belongs_to :cabin

  validates :start_date, presence: true
  validates :end_date, presence: true

  def cabin_name(cabin_id)
    cab = Cabin.find_by id: cabin_id
    return cab.name
  end

  def user_name(user_id)
    usr = User.find_by id: user_id
    return usr.name
  end

end
