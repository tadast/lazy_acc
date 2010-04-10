class AddCreditDebetToBucket < ActiveRecord::Migration
  def self.up
    add_column :buckets, :credit_debet, :integer, :default => -1
  end

  def self.down
    remove_column :buckets, :credit_debet
  end
end
