class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :time
      t.integer :cabin_id
      t.integer :user_id

      t.timestamps
    end
  end
end
