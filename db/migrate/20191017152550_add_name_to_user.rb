class AddNameToUser < ActiveRecord::Migration
  def change
    change_column_null :users, :email, false
    add_column :users, :name, :string
  end
end
