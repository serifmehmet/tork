class Admin::UserProposalFormsController < ApplicationController
	before_action :auth_user!, :is_admin_control!

	layout "admin/admin"
  def index
  	@proposal_forms = UserProposalForm.sorted
  end

  def edit
  	@proposal_form = UserProposalForm.find(params[:id])
  end

  def update
  	@proposal_form = UserProposalForm.find(params[:id])

  	if @proposal_form.update_attributes(proposal_form_params)
  		flash[:notice] = "Teklif formu başarıyla güncellenmiştir!"
  		redirect_to "index"
  	else
  		flash[:alert] = "Teklif formu güncellenirken bir problem oluştu. Lütfen tekrar deneyiniz!"
  		render "edit"
  	end
  end

  def delete
  	@proposal_form = UserProposalForm.find(params[:id])
  end

  def destroy
  	@proposal_form = UserProposalForm.find(params[:id]).destroy

  	flash[:notice] = "'#{@proposal_form.form_no}' numaralı teklif başarıyla silinmiştir!"
  	redirect_to "index"
  end 

  private
  	def proposal_form_params
      params.require(:user_proposal_forms).permit(:first_name, :last_name, :form_no, :email, :address, 
      	:phone_number, :care_operation, :given_cost, :is_accepted, :brand_id, :brand_make_id)
    end
end
