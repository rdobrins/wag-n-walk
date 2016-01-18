class AddBooleanToUser < ActiveRecord::Migration
  def change
    add_column :users, :walker, :boolean, default: false
  end
end
