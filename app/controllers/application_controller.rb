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
  		redirect_to(:controller => "admin", :action => "login")
  	end
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
  
end
