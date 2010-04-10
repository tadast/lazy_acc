class Transaction < ActiveRecord::Base
  belongs_to :bucket
  named_scope :unconfirmed, {:conditions => "status=#{Transaction::STATUS[:unconfirmed]}" }

  STATUS = {
    :unconfirmed => 0,
    :confirmed => 1
  }.freeze

end
