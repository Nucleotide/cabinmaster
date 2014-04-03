class AddUserIdToSupplies < ActiveRecord::Migration
  def change
    add_column :supplies, :user_id, :integer
  end
end
