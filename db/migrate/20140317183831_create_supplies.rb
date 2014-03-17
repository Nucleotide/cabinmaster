class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.string :info
      t.integer :cabin_id

      t.timestamps
    end
  end
end
