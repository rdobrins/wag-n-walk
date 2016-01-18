class DogAvatarsAndUsers < ActiveRecord::Migration
  def change
    add_column :dogs, :avatar, :string
    add_column :dogs, :user_id, :integer, null: false
    add_column :dogs, :body, :text
  end
end
