class Transaction < ActiveRecord::Base
  STATUS = {
    :unconfirmed => 0,
    :confirmed => 1
  }.freeze

  belongs_to :bucket
  named_scope :unconfirmed, { :conditions => "status=#{Transaction::STATUS[:unconfirmed]}" }

end
