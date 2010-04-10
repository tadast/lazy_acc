class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.integer :bucket_id
      t.string :title
      t.text :description
      t.integer :amount
      t.datetime :start_date
      t.datetime :end_date
      t.integer :periodicity

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
