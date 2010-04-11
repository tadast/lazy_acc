class AddHasCurrentBudgetsForUser < ActiveRecord::Migration
  def self.up
    add_column :users, :has_current_budgets, :boolean
  end

  def self.down
    remove_column :users, :has_current_budgets
  end
end
