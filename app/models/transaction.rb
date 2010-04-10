class Transaction < ActiveRecord::Base
  belongs_to :bucket
  STATUS = {
    :unconfirmed => 0,
    :confirmed => 1
  }.freeze
  named_scope :current, :include => :bucket, :conditions => ['transactions.created_at <= ? AND transactions.created_at >= ?', Time.now.end_of_month, Time.now.beginning_of_month]
  
  
  belongs_to :bucket
  named_scope :unconfirmed, { :conditions => "status=#{Transaction::STATUS[:unconfirmed]}" }

end
