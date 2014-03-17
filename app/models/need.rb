class Need < ActiveRecord::Base

  belongs_to :cabin
  belongs_to :user

end
