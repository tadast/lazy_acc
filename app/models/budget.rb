class Budget < ActiveRecord::Base
  belongs_to :bucket
  named_scope :name, lambda { |*args| { :conditions => ['budget.valid_from => ? AND budget.valid_to <= ? AND budget.bucket_id = ?', args.first] } }
  
  def current
    
  end
  
  def self.create_if_needed(user, bucket)
    self.
  end
end
