class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :info
      t.integer :cabin_id
      t.integer :user_id

      t.timestamps
    end
  end
end
