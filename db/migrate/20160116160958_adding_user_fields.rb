class AddingUserFields < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :phone_number, :string, default: ""
    add_column :users, :address, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :zip, :string, null: false
    add_column :users, :admin, :boolean, default: "false"
  end
end
