class AccountRecordsController < ApplicationController
  def index
    
  end

  def new
    @account_record = AccountRecord.new
    @time = Time.new
  end

  def create
    redirect_to account_records_path
  end

  def update
  end

  def show
  end
end
