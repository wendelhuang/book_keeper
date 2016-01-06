class AccountRecord < ActiveRecord::Base
  validates_presence_of :record_type, :amounts
  with_options :allow_blank => true do |v|
    v.validates_numericality_of :amounts
  end

  scope :incomings, lambda { where(:incoming_or_outgoing => 1) }
  scope :outgoings, lambda { where(:incoming_or_outgoing => -1) }
  
  scope :day, lambda { |time| where(:occur_date => time.strftime("%Y-%m-%d"))}
  
  scope :sorted, lambda { order("#{table_name}.updated_at DESC")}
end
