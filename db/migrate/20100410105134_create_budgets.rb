class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.integer :amount
      t.integer :bucket_id
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
