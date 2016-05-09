class AccountRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :record_type
  #has_one :record_type

  validates_presence_of :record_type_id, :amounts
  with_options :allow_blank => true do |v|
    v.validates_numericality_of :amounts
  end

  #scope :join_record_type, lambda { joins(:record_type) }
  scope :include_record_type, lambda { includes(:record_type) }
  #scope :join_record_type, lambda { joins('LEFT OUTER JOIN record_types ON account_records.record_type_id = record_types.id') }

  scope :incomings, lambda { where(:incoming_or_outgoing => 1) }
  scope :outgoings, lambda { where(:incoming_or_outgoing => -1) }
  
  scope :date_range, lambda { |time_start, time_end| 
    where(
      :occur_date => ( time_start.strftime("%Y-%m-%d")..(time_end + 1.day).strftime("%Y-%m-%d") )
    )
  }
  
  scope :sorted, lambda { order("#{table_name}.occur_date DESC")}
end
