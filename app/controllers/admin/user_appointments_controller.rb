class Admin::UserAppointmentsController < ApplicationController
  before_action :auth_user!, :is_admin_control!
	layout "admin/admin"
  def index
  	@user_appointments = UserAppointment.sorted
  end

  def edit
    @user_appointment = UserAppointment.find(params[:id])
  end

  def update
    @user_appointment = UserAppointment.find(params[:id])

    if @user_appointment.update_attributes(user_appointment_params)
      flash[:notice] = "Randevu başarıyla güncellenmiştir."
      redirect_to admin_user_appointments_path
    else
      flash[:alert] = "Randevu günncellenirken bir hata oluştu. Lütfen tekrar deneyiniz!"
      render 'edit'
    end
  end

  def delete
    @user_appointment = UserAppointment.find(params[:id])
  end

  def destroy
    @user_appointment = UserAppointment.find(params[:id]).destroy

    flash[:notice] = "Randevu başarıyla silinmiştir."
    redirect_to admin_user_appointments_path
  end

  private
    def user_appointment_params
      params.require(:user_appointment).permit(:first_name, :last_name, :email, :address, :phone_number, :care_operation, 
        :brand_id, :brand_make_id)
    end
end
