class AccountRecord < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :record_type, :amounts
  with_options :allow_blank => true do |v|
    v.validates_numericality_of :amounts
  end

  scope :incomings, lambda { where(:incoming_or_outgoing => 1) }
  scope :outgoings, lambda { where(:incoming_or_outgoing => -1) }
  
  scope :date, lambda { |time| where(:occur_date => time.strftime("%Y-%m-%d"))}
  scope :date_range, lambda { |time_start, time_end| 
    where(
      :occur_date => ( time_start.strftime("%Y-%m-%d")..time_end.strftime("%Y-%m-%d") )
    )
  }
  
  scope :sorted, lambda { order("#{table_name}.updated_at DESC")}
end
