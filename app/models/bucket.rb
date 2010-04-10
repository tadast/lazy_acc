class Bucket < ActiveRecord::Base
  belongs_to :user
  has_many :bills
  has_many :budgets
  has_many :transactions
end
