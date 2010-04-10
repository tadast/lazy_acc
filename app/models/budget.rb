class Budget < ActiveRecord::Base
  belongs_to :bucket
  # named_scope :current_for_bucket, lambda { |*args| { :conditions => ["budget.valid_from => `?` AND budgets.valid_to <= `?` AND budgets.bucket_id = ?", args.first, args.second, args.second] } }
  named_scope :from_to, lambda { |param| { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", param, param] } }
  named_scope :for_this_month, { :conditions => ["budgets.valid_from >= ? AND budgets.valid_to <= ?", Date.today.beginning_of_month, Date.today.end_of_month] }
  
  def self.create_current(user)
    user.buckets.each do |bucket|
      bucket.budgets.build(:valid_from => Date.today.beginning_of_month, :valid_to => Date.today.end_of_month)
    end
    return user.budgets
  end
  

end
