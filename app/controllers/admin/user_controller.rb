class Admin::UserController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [:new, :cancel]
 
  # def new
  #   build_resource({})
  #   <<<<self.resource.company = Company.new
  #   respond_with self.resource
  # end
 
  def create
    super
  end
 
  private
 
  def sign_up_params
    allow = [:email, :password, :password_confirmation, :first_name, :last_name, :is_admin, :address, :username]
    params.require(resource_name).permit(allow)
  end
 
end