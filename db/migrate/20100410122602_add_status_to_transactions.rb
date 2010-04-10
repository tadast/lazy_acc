class AddStatusToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :status, :integer, :default => Transaction::STATUS[:unconfirmed]
  end

  def self.down
    remove_column :transactions, :status
  end
end
