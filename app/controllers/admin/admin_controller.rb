class Admin::AdminController < ApplicationController
	before_action :auth_user!, :is_admin_control!, :except => [:login]

  def index
  	respond_to do |format|
		  format.html { render layout: "admin/admin" }
		end


  end

  def login
  	respond_to do |format|
		  format.html { render layout: "admin/login" }
		end
  end
end
