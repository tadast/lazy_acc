class User < ActiveRecord::Base
  acts_as_authentic
  has_many :buckets
  has_many :budgets, :through => :buckets
  has_many :bills, :through => :buckets
  has_many :transaction, :through => :buckets
  after_create :create_template_buckets
  
  def create_template_buckets
    Bucket::TEMPLATE.each do |key, value|
      buck = self.buckets.build(value)
    end
    return self.save
  end
end
