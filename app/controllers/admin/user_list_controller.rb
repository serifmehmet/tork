class Admin::UserListController < ApplicationController

  before_action :authenticate_user!, :is_admin_control!
  
	layout 'admin/admin'
  def index
  	@user_list = User.all
  end

  def new
  	@user = User.new
  end

  def edit
  end

  def delete
  end

  def create_user
    
  end
end
