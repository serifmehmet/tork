class Admin::UserProposalFormsController < ApplicationController
	before_action :auth_user!, :is_admin_control!
  def index
  end

  def edit
  end

  def delete
  end
end
