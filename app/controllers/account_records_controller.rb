class AccountRecordsController < ApplicationController
  def index
    @account_records = AccountRecord.all
    @incoming_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == 1 }
    @outgoing_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == -1 }
  end

  def new
    @account_record = AccountRecord.new
    @time = Time.new
  end

  def create
    @account_record = AccountRecord.new(account_record_params)
    @account_record.save
    redirect_to account_records_path
  end

  def update
  end

  def show
  end

  private
  def account_record_params
    params.require(:account_record).permit(:amounts, :incoming_or_outgoing, :record_type, :description)
  end
end
