class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.string :date, null: false
      t.string :capacity, null: false, default: 1
    end
  end
end
