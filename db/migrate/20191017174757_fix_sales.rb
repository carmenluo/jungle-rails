class FixSales < ActiveRecord::Migration
  def change
    remove_column :sales, :integer, :string
    add_column :sales, :status, :string
    add_column :sales, :percent_off, :integer
  end
end
