class Budget < ActiveRecord::Base
  belongs_to :bucket
  # named_scope :current_for_bucket, lambda { |*args| { :conditions => ["budget.valid_from => `?` AND budgets.valid_to <= `?` AND budgets.bucket_id = ?", args.first, args.second, args.second] } }
  # named_scope :from_to, lambda { |param| { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", param, param] } }
  named_scope :for_this_month, { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", Date.today.beginning_of_month, Date.today.end_of_month] }

  TEMPLATE_AMOUNTS = {
    "Finance" => 500,
    "Body" => 1000,
    "Mind" => 200,
    "Environment" => 400,
    "Out" => 400,
    "Income" => 4000
  }.freeze

  def self.last_month(bucket)
    time = Time.now - 1.month
    bucket.budgets.first(:conditions => ["valid_from >= ? and valid_to <= ?", time, time])
  end

  def self.create_current(user)
    #create budgets for current month
    unless user.has_current_budgets?
      user.buckets.each do |bucket|
        last_month_budget = Budget.last_month(bucket)
        if last_month_budget
          amount = last_month_budget.amount
        elsif Budget::TEMPLATE_AMOUNTS[bucket.title]
          amount = Budget::TEMPLATE_AMOUNTS[bucket.title]
        else
          amount = 0
        end
        bucket.budgets.build(:valid_from => Date.today.beginning_of_month, :valid_to => Date.today.end_of_month, :amount => amount)

        total_transactions = 0
        bucket.bills.active.each do |bill|
          trans_amount = bill.amount
          bucket.transactions.build(:amount => trans_amount, :title => bill.title)
          total_transactions += trans_amount
        end
        #bucket.transactions.build(:amount => total_transactions, :title => "unknown")
        bucket.save
      end
      user.update_attributes(:has_current_budgets => true)
    end
  end
  

end
