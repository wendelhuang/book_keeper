class AccountRecordsController < ApplicationController

  before_filter :set_time, :only => [:new, :create, :index]
  before_filter :set_account_record, :only => [:edit, :update, :show, :destroy]
  before_filter :authenticate_user!

  def index
    @account_records = current_user.account_records.day(params['time'] ||= @time).sorted
    #@incoming_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == 1 }
    #@outgoing_records = @account_records.select {|account_record| account_record.incoming_or_outgoing == -1 }
    @incoming_records = current_user.account_records.incomings.day(params['time'] ||= @time).sorted
    @outgoing_records = current_user.account_records.outgoings.day(params['time'] ||= @time).sorted
  end

  def new
    @account_record = AccountRecord.new
  end

  def create
    @account_record = AccountRecord.new(account_record_params)
    @account_record.user_id = current_user.id
    puts "#{current_user}---------------#{@account_record.user_id}"
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
    @time = Time.new
  end
  def set_account_record
    @account_record = AccountRecord.find(params[:id])
  end
end
