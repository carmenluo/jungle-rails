class SetNullFalseUser < ActiveRecord::Migration
  def change
    change_column_null :users, :password_digest, false
    change_column_null :users, :name, false
  end
end
