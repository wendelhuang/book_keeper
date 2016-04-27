class AccountRecordsController < ApplicationController

  before_filter :set_time, :only => [:index, :new]
  before_filter :set_account_record, :only => [:edit, :update, :show, :destroy]
  before_filter :authenticate_user!

  def index
    if params['account_records_date_start'] or params['account_record_date_end']
      begin
        @time_start = DateTime.parse(params['account_records_date_start'])
      rescue
        @time_start = DateTime.now
      end
      begin
        @time_end = DateTime.parse(params['account_records_date_end'])
      rescue
        @time_end = DateTime.now
      end
      @account_records = current_user.account_records.date_range(@time_start, @time_end).sorted
      @incoming_records = current_user.account_records.incomings.date_range(@time_start, @time_end).sorted
      @outgoing_records = current_user.account_records.outgoings.date_range(@time_start, @time_end).sorted
    else
      @account_records = current_user.account_records.date(@time).sorted
      #@incoming_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == 1 }
      #@outgoing_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == -1 }
      @incoming_records = current_user.account_records.incomings.date(@time).sorted
      @outgoing_records = current_user.account_records.outgoings.date(@time).sorted
      @time_start, @time_end = @time, @time
    end
  end

  def new
    @account_record = AccountRecord.new
  end

  def create
    @account_record = AccountRecord.new(account_record_params)
    @account_record.user_id = current_user.id
    
    if @account_record.save
      redirect_to account_records_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account_record.update(account_record_params)
      redirect_to @account_record, :notice => 'AccountRecord update successfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @account_record.destroy
    redirect_to account_records_url, :notice => "删除成功"
  end

  private
  def account_record_params
    params.require(:account_record).permit(:amounts, :occur_date, :incoming_or_outgoing, :record_type, :description)
  end
  def set_time
    @time = DateTime.now
  end
  def set_account_record
    @account_record = AccountRecord.find(params[:id])
  end
end
