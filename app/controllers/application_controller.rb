class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  #ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクト
  before_action :configure_permitted_parameters, if: :devise_controller?
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  
  def after_sign_in_path_for(resource)
    post_images_path
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
