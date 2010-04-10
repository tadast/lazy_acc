class Transaction < ActiveRecord::Base
  STATUS = {
    :unconfirmed => 0,
    :confirmed => 1
  }.freeze
  STATUS_NAME = {
    0 => "Unconfirmed",
    1 => "Confirmed"
  }.freeze

  belongs_to :bucket
  named_scope :unconfirmed, { :conditions => "status=#{Transaction::STATUS[:unconfirmed]}" }

end
