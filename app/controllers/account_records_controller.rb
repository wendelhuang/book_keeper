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
    else
      @time_start, @time_end = @time, @time
    end
    @account_records = current_user.account_records.include_record_type.date_range(@time_start, @time_end).sorted
    @incoming_records = current_user.account_records.include_record_type.incomings.date_range(@time_start, @time_end).sorted
    @outgoing_records = current_user.account_records.include_record_type.outgoings.date_range(@time_start, @time_end).sorted
  end

  def new
    @account_record = AccountRecord.new
    @record_types = current_user.record_types.all.sorted
    @record_type = @record_types.first
  end

  def create
    @record_type_id = params['account_record']['record_type']
    @record_type_title = params['account_record']['record_type_title'].strip

    @account_record = AccountRecord.new(account_record_params)
    @account_record.user_id = current_user.id
    @record_type = RecordType.find(@record_type_id)
    if @record_type.blank? || @record_type.title != @record_type_title
      @record_type = RecordType.where(:title => @record_type_title).first
      @record_type = RecordType.create(@record_type_title, current_user.id) if @record_type.blank?
    end
    @account_record.record_type_id = @record_type.id
    
    if @account_record.save
      redirect_to account_records_path
    else
      render :new
    end
  end

  def edit
    @record_types = current_user.record_types.all.sorted
    @record_type = RecordType.find(@account_record.record_type)
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
    params.require(:account_record).permit(:amounts, :occur_date, :incoming_or_outgoing, :description)
  end
  def set_time
    @time = DateTime.now
  end
  def set_account_record
    @account_record = AccountRecord.find(params[:id])
  end
end
