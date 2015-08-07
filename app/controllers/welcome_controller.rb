class WelcomeController < ApplicationController
  def index
    @user = User.new
	@user.name = '黄伟伟'
  end
end
