class Bill < ActiveRecord::Base
  belongs_to :bucket
  has_many :transactions

  named_scope :active, lambda {|*args| {:conditions => ["start_date >= ? AND end_date <= ?", args.first || Date.today, args.first || Date.today]}}

  after_create :create_transaction
  before_destroy :delete_transactions
  
  def delete_transactions
    self.transactions.unconfirmed.delete_all
  end

  def create_transaction
    self.bucket.transactions.create(:title => self.title, :amount => self.amount)
    self.bucket.save
  end

end
