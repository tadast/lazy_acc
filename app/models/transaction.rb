class Transaction < ActiveRecord::Base
  STATUS = {
    :unconfirmed => 0,
    :confirmed => 1
  }.freeze
  STATUS_NAME = {
    0 => "Unconfirmed",
    1 => "Confirmed"
  }.freeze

  named_scope :current, :include => :bucket, :conditions => ['transactions.created_at <= ? AND transactions.created_at >= ?', Time.now.end_of_month, Time.now.beginning_of_month]
  belongs_to :bucket
  named_scope :unconfirmed, { :conditions => "status=#{Transaction::STATUS[:unconfirmed]}" }

end
