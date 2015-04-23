class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_admin_control!
  	
  	user = current_user

  	if user.is_admin?
  		sign_in(user, store: false)

  	else
      sign_out(user)
      flash[:alert] = "Bu sayfaya erişim yetkiniz yok."
  		redirect_to(:controller => "admin", :action => "login")
  	end
  end

  def auth_user!
    redirect_to admin_login_url unless user_signed_in?
  end

  protected
    def after_sign_in_path_for(resource)
      user = current_user

      if user.is_admin?
        return admin_root_url
      else
        # Eğer kullanıcı normal ise routes-> root adresine gidecek TO-DO
        return admin_root_url 
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if params[:controller] = "admin"
        return admin_login_url
      else
        return "http://www.google.com"
      end
    end
  
end
