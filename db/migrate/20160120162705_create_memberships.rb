class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :walk, index: true
      t.belongs_to :dog, index: true
    end
  end
end
