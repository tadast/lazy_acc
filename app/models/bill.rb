class Bill < ActiveRecord::Base
  belongs_to :bucket
  has_many :transactions
  before_destroy :delete_transactions

  named_scope :active => lambda {|*args| {:conditions => ["start_date >= ? AND end_date <= ?", args.first || Time.now, args.first || Time.now]}}

  def delete_transactions
    self.transactions.unconfirmed.delete_all
  end

end
