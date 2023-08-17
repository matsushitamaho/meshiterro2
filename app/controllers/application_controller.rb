class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  
  def after_sign_in_path_for(resource)
    about_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #devise_parameter_sanitizer.permitメソッドを使うことでsign_upの際に、nameのデータ操作を許可
  end
end
