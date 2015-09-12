module AccountRecordsHelper
  def aggregate(account_records)
    sum = 0
    if !account_records.nil?
      account_records.each do |ar|
        sum += ar.incoming_or_outgoing * ar.amounts
      end
    end
    number_to_currency sum
  end
end
