class AddBillIdToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :bill_id, :integer
  end

  def self.down
    remove_column :transactions, :bill_id
  end
end
