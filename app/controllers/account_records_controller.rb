class AccountRecordsController < ApplicationController

  before_filter :set_time, :only => [:new, :create]

  def index
    @account_records = AccountRecord.all
    #@incoming_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == 1 }
    #@outgoing_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == -1 }
    @incoming_records = AccountRecord.incomings
    @outgoing_records = AccountRecord.outgoings
  end

  def new
    @account_record = AccountRecord.new
  end

  def create
    @account_record = AccountRecord.new(account_record_params)
    if @account_record.save
      redirect_to account_records_path
    else
      render :new
    end
  end

  def update
  end

  def show
  end

  private
  def account_record_params
    params.require(:account_record).permit(:amounts, :occur_date, :incoming_or_outgoing, :record_type, :description)
  end
  def set_time
    @time = Time.new
  end
end
