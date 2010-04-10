class Budget < ActiveRecord::Base
  belongs_to :bucket
  # named_scope :current_for_bucket, lambda { |*args| { :conditions => ["budget.valid_from => `?` AND budgets.valid_to <= `?` AND budgets.bucket_id = ?", args.first, args.second, args.second] } }
  # named_scope :from_to, lambda { |param| { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", param, param] } }
  named_scope :for_this_month, { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", Date.today.beginning_of_month, Date.today.end_of_month] }
  
  def self.create_current(user)
    #create budgets for current month
    user.buckets.each do |bucket|
      
      budget = bucket.budgets.build(:valid_from => Date.today.beginning_of_month, :valid_to => Date.today.end_of_month)
      
      total_transactions = 0
      bucket.bills.active.each do |bill|
        trans_ammount = bill.amount * bucket.credit_debet
        bucket.transactions.build(:amount => trans_amount, :title => bill.title)
        total_transactions += trans_amount
      end
      bucket.transactions.build(:amount => total_transactions, :title => "unknown")
      bucket.save
    end
    return user.budgets
  end
  

end
