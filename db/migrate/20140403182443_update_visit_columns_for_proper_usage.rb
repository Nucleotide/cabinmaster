class UpdateVisitColumnsForProperUsage < ActiveRecord::Migration
  def change
    add_column :visits, :start_date, :date
    add_column :visits, :end_date, :date
    remove_column :visits, :time
  end
end
