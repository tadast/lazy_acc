class Transaction < ActiveRecord::Base
  belongs_to :bucket
end
