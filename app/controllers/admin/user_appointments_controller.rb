class Admin::UserAppointmentsController < ApplicationController
  before_action :authenticate_user!, :is_admin_control!
	layout "admin/admin"
  def index
  	@user_appointments = UserAppointment.sorted
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
