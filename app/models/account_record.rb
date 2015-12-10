class AccountRecord < ActiveRecord::Base
  validates_presence_of :record_type, :amounts
  with_options :allow_blank => true do |v|
    v.validates_numericality_of :amounts
  end

  scope :incomings => lambda { where("#{AccountRecord.table_name}.incoming_or_outgoing = 1") }
  scope :outgoings => lambda { where("#{AccountRecord.table_name}.incoming_or_outgoing = -1") }
end
