class Bill < ActiveRecord::Base
  belongs_to :bucket
  has_many :transactions


end
