class Bill < ActiveRecord::Base
  belongs_to :bucket
  has_many :transactions, :on_delete => :delete_transactions
  after_create :create_transaction

  named_scope :active, lambda {|*args| {:conditions => ["start_date >= ? AND end_date <= ?", args.first || Date.today, args.first || Date.today]}}

  def delete_transactions
    self.transactions.unconfirmed.delete_all
  end

  def create_transaction
    self.transactions << Transaction.new(:title => self.title, :amount => self.amount * self.bucket.credit_debet)
    self.save
  end

end
