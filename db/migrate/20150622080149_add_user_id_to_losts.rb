class AddUserIdToLosts < ActiveRecord::Migration
  def change

  	add_column :losts, :user_id, :integer
  	add_index :losts, :user_id

  end
end
