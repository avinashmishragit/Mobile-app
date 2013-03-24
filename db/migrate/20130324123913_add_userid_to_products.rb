class AddUseridToProducts < ActiveRecord::Migration
  def change
    add_column :products, :userid, :int
  end
end
