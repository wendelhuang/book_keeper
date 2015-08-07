class AccountRecordsController < ApplicationController
  def index
    
  end

  def new
    @account_record = AccountRecord.new
    @time = Time.new
  end

  def create
  end

  def update
  end

  def show
  end
end
