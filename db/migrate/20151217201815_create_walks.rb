class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.date :date, null: false
      t.integer :capacity, null: false, default: 1
      t.integer :user_id, null: false
      t.text :body
    end
  end
end
