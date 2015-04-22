class Admin::AdminController < ApplicationController
	

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
